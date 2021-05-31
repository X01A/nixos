{
  description = "Personal nixos modules and packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosModules.indexyz = { ... }: {
      imports = [ ./modules/all-modules.nix ];
    };
  };
}
