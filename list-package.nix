let
  nixpkgs = import <nixpkgs> {};
  flake = import ./.;
  listsToName = list: nixpkgs.lib.attrsets.mapAttrsToList (name: value: name) list;
  isDerivation = package: nixpkgs.lib.attrsets.hasAttrByPath [ "drvPath" ] package;
  derivationLists = nixpkgs.lib.attrsets.filterAttrs (name: value: isDerivation value) flake.outputs.legacyPackages.x86_64-linux;

  jsonPackages = builtins.toJSON (listsToName derivationLists);
  packageFile = nixpkgs.writeText "packages.json" jsonPackages;
in
packageFile
