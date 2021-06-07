{
  description = "Personal nixos modules and packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      packages = import ./packages
        {
          nixpkgs = import nixpkgs {
            inherit system;
          };
        };
    in
    {
      legacyPackages.${system} = packages;
      overlay = final: prev: packages;
      nixosModules.indexyz = { ... }: {
        imports = [ ./modules/all-modules.nix ];
      };
    };
}
