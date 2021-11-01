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
      pkgs = import nixpkgs {
        inherit system;
      };
      packages = import ./packages { nixpkgs = pkgs; };
    in
    {
      legacyPackages.${system} = packages;
      overlay = final: prev: packages;
      nixosModules.indexyz = { ... }: {
        imports = [ ./modules/all-modules.nix ];
      };

      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          nvfetcher
        ];
      };
      homeModules.indexyz = { ... }: {
        imports = [ ./home/all-modules.nix ];
      };
    };
}
