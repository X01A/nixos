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
}
