{ inputs, ... }:

{
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];

  perSystem = { inputs', config, pkgs, self', system, ... }: let
    os = pkgs.lib.last (pkgs.lib.strings.splitString "-" system);
    normalPkgs = import inputs.nixpkgs { inherit system; };
  in rec {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        inputs.rust-overlay.overlays.default
      ];
    };

    packages = import ../packages {
      inherit os pkgs normalPkgs system;
      flakeInputs = inputs;

      npmlock2nix = pkgs.callPackage inputs.npmlock2nix { };
    };

    overlayAttrs = packages;
  };
}
