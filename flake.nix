{
  description = "Personal nixos modules and packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    npmlock2nix = {
      url = "github:serokell/nix-npm-buildpackage";
      flake = false;
    };

    cloudreve-cli = {
      url = "github:Indexyz/CloudreveCLI";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.flake-compat.follows = "flake-compat";
    };
  };

  outputs = { self, nixpkgs, flake-utils, cloudreve-cli, npmlock2nix, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" ]
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          os = pkgs.lib.last (pkgs.lib.strings.splitString "-" system);

          packages = import ./packages {
            nixpkgs = pkgs; inherit os;
            npmlock2nix = pkgs.callPackage npmlock2nix {
              nodejs = pkgs.nodejs-14_x;
            };
          };
          packageList = (pkgs.lib.attrsets.mapAttrsToList (name: value: { inherit name value; }) packages);
          buildPacakgesList = builtins.filter
            (item:
              let
                meta = pkgs.lib.attrsets.attrByPath [ "meta" "platforms" ] [ system ] item.value;
              in
              (pkgs.lib.lists.any (item: item == system) meta))
            packageList;
          buildPacakges = builtins.listToAttrs buildPacakgesList;
          finalPackages = buildPacakges //
          cloudreve-cli.legacyPackages."${system}";
        in
        {
          legacyPackages = finalPackages;
          overlay = final: prev: finalPackages;
          overlays = builtins.mapAttrs (overlayPkgs: (final: prev: overlayPkgs)) buildPacakges;
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              nvfetcher
            ];
          };
        }) // {
      nixosModules.indexyz = { ... }: {
        imports = [ ./modules/all-modules.nix ];
      };
      nixosModules.secrets = { ... }: {
        imports = [ ./modules/services/secrets ];
      };
      homeModules.indexyz = { ... }: {
        imports = [ ./home/all-modules.nix ];
      };
      darwinModules.indexyz = { ... }: {
        imports = [ ./modules/darwin ];
      };

      installer.iso = import "${toString nixpkgs}/nixos/lib/eval-config.nix" {
        system = "x86_64-linux";

        modules = [
          "${toString nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./modules/all-modules.nix
          ./modules/installer/iso.nix
        ];
      };
    };
}
