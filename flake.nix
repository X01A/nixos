{
  description = "Personal nixos modules and packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let packages = {
      linuxPackages_latest_chromeos = nixpkgs.callPackage ./packages/chromeos-kernel.nix;
    };
    in
    {
      legacyPackages."x86_64-linux" = packages;
      overlay = final: prev: packages;
      nixosModules.indexyz = { ... }: {
        imports = [ ./modules/all-modules.nix ];
      };
    };
}
