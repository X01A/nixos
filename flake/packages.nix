{ inputs, ... }:

{
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];

  perSystem = { inputs', config, pkgs, self', system, ... }: let
    os = pkgs.lib.last (pkgs.lib.strings.splitString "-" system);
    normalPkgs = import inputs.nixpkgs { inherit system; };
  in {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        inputs.rust-overlay.overlays.default
        inputs.self.overlays.default
      ];
    };

    packages = import ../packages {
      inherit os pkgs normalPkgs system;
      flakeInputs = inputs;

      npmlock2nix = pkgs.callPackage inputs.npmlock2nix { };
    };

    # buildPacakges = let
    #   # isDerivation = package: normalPkgs.lib.attrsets.hasAttrByPath [ "drvPath" ] package;
      # packageList = (normalPkgs.lib.attrsets.mapAttrsToList (name: value: {
      #   inherit name;
      # }) self'.packages);

      # packageList = (builtins.filter (it: isDerivation it.value) (normalPkgs.lib.attrsets.mapAttrsToList (name: value: {
      #   inherit name value;
      # }) self'.packages));

      # buildPacakgesList = builtins.filter
      #   (item:
      #     let
      #       meta = pkgs.lib.attrsets.attrByPath [ "meta" "platforms" ] [ system ] item.value;
      #     in
      #     (pkgs.lib.lists.any (item: item == system) meta))
      #   packageList;

    #   jsonPackages = builtins.toJSON packageList;
    #   # result = builtins.listToAttrs buildPacakgesList;
    # in jsonPackages;
  };
}
