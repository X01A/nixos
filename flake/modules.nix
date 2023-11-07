{ inputs, ... }:

{
  flake.nixosModules = {
    default = { ... }: {
      imports = [ ../modules/all-modules.nix ];
    };
  };
}
