{
  description = "Personal nixos modules and packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cloudreve-cli = {
      url = "github:Indexyz/CloudreveCLI";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.flake-compat.follows = "flake-compat";
    };
  };

  outputs = { self, nixpkgs, flake-utils, cloudreve-cli, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ]
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          packages = import ./packages { nixpkgs = pkgs; };
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
      homeModules.indexyz = { ... }: {
        imports = [ ./home/all-modules.nix ];
      };
    };
}
