{ inputs, ... }:

{
  flake.nixosModules = {
    default = { ... }: {
      imports = ../modules;
    };
  };
}
