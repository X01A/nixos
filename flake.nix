{
  description = "Personal nixos modules and packages";

  inputs = {
    nixpkgs.url = "github:5aaee9/nixpkgs";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    flake-utils.url = "github:numtide/flake-utils";

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

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, cloudreve-cli, npmlock2nix, rust-overlay, ... }@flakeInputs:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" ]
      (system:
        let

          normalPkgs = import nixpkgs {
            inherit system;
          };

          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              rust-overlay.overlays.default
              self.overlay."${system}"
            ];
          };

          os = normalPkgs.lib.last (normalPkgs.lib.strings.splitString "-" system);

          packages = import ./packages {
            inherit os flakeInputs pkgs normalPkgs nixpkgs;
            npmlock2nix = pkgs.callPackage npmlock2nix {
              nodejs = pkgs.nodejs-14_x;
            };
          };

          isDerivation = package: normalPkgs.lib.attrsets.hasAttrByPath [ "drvPath" ] package;
          packageList = (builtins.filter (it: isDerivation it.value) (normalPkgs.lib.attrsets.mapAttrsToList (name: value: { inherit name value; }) packages));
          buildPacakgesList = builtins.filter
            (item:
              let
                meta = normalPkgs.lib.attrsets.attrByPath [ "meta" "platforms" ] [ system ] item.value;
              in
              (normalPkgs.lib.lists.any (item: item == system) meta))
            packageList;

          jsonPackages = builtins.toJSON (map (it: it.name) buildPacakgesList);

          buildPacakges = builtins.listToAttrs buildPacakgesList;
          finalPackages = buildPacakges //
          cloudreve-cli.legacyPackages."${system}";
          prefetch = normalPkgs.nix-prefetch.override { nix = normalPkgs.nixUnstable; };
        in
        {
          legacyPackages = finalPackages // {
            packageList = pkgs.writeText "packages.json" jsonPackages;
          };
          packages = finalPackages;
          overlay = final: prev: packages;
          overlays = builtins.mapAttrs (overlayPkgs: (final: prev: overlayPkgs)) buildPacakges;
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              nvfetcher
              prefetch
              nixpkgs-fmt
              nix-update
              bash
              shellcheck
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

      installer.iso = (import "${toString nixpkgs}/nixos/lib/eval-config.nix" {
        system = "x86_64-linux";

        modules = [
          "${toString nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./modules/all-modules.nix
          ./modules/installer/iso.nix
        ];
      }).config.system.build.isoImage;

      azure.image = import "${toString nixpkgs}/nixos/lib/eval-config.nix" {
        system = "x86_64-linux";
        modules = [
          ./modules/all-modules.nix
          "${toString nixpkgs}/nixos/modules/virtualisation/azure-image.nix"

          ({ pkgs, lib, config, ... }: {
            indexyz = {
              services.ssh.enable = true;
              environment.base.enable = true;
            };
          })
        ];
      };

      rpi.image = (import "${toString nixpkgs}/nixos/lib/eval-config.nix" {
        system = "aarch64-linux";
        modules = [
          "${toString nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          ./modules/all-modules.nix
          ({ pkgs, lib, config, ... }: {
            indexyz.services.ssh.enable = true;
            indexyz.environment.base.enable = true;

          })
        ];
      }).config.system.build.sdImage;

      qcow2.image = (import "${toString nixpkgs}/nixos/lib/eval-config.nix" {
        system = "x86_64-linux";
        modules = [
          ./modules/all-modules.nix
          ./modules/installer/qcow2.nix
        ];
      }).config.system.build.qcow;
    };
}
