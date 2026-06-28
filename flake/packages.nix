{ inputs, ... }:

{
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];

  perSystem =
    {
      inputs',
      config,
      pkgs,
      self',
      system,
      ...
    }:
    let
      os = pkgs.lib.last (pkgs.lib.strings.splitString "-" system);
      normalPkgs = import inputs.nixpkgs { inherit system; };
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          inputs.rust-overlay.overlays.default
        ];
      };
      packageSet = import ../packages {
        inherit
          os
          pkgs
          normalPkgs
          system
          ;
        flakeInputs = inputs;

        npmlock2nix = pkgs.callPackage inputs.npmlock2nix { };
      };

      flakePackages = pkgs.lib.filterAttrs (
        name: value: name == "packageList" || pkgs.lib.isDerivation value
      ) packageSet;
    in
    rec {
      packages = flakePackages;

      overlayAttrs = packageSet;
    };
}
