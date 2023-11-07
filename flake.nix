{
  description = "Personal nixos modules and packages";

  inputs = {
    nixpkgs.url = "github:5aaee9/nixpkgs";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    flake-utils.url = "github:numtide/flake-utils";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    npmlock2nix = {
      url = "github:serokell/nix-npm-buildpackage";
      flake = false;
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
    ];


    imports = [
      ./lib
      ./flake/modules.nix
      ./flake/packages.nix
      ./flake/dev.nix
    ];
  };
}
