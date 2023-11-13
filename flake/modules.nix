{ inputs, ... }:

{
  flake.nixosModules = {
    indexyz = { ... }: {
      imports = [ ../modules/all-modules.nix ];
    };
  };

  flake.homeModules.indexyz = {
    imports = [ ../home/all-modules.nix ];
  };


  flake.installer = (import "${toString inputs.nixpkgs}/nixos/lib/eval-config.nix" {
    system = "x86_64-linux";

    modules = [
      "${toString inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
      ../modules/all-modules.nix
      ../modules/installer/iso.nix

      ({...}: {
        # Install disko
        environment.systemPackages = [
          inputs.disko.packages."x86_64-linux".disko
        ];
      })
    ];
  }).config.system.build.isoImage;
}
