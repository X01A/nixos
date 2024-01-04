{ pkgs, normalPkgs, os, npmlock2nix, flakeInputs, system }:

with normalPkgs.lib;
let
  nvfetcherOut = normalPkgs.callPackage ../sources.nix { };
  build-electron-appimage = normalPkgs.callPackage ./build-electron-appimage { };
  osPkgPath = ./. + "/os-specific/${os}";
  systemPackages = if builtins.pathExists osPkgPath then normalPkgs.callPackage osPkgPath { inherit pkgs normalPkgs nvfetcherOut; } else { };

  dirOnly = it: if it.value == "directory" then true else false;
  hasPkgFile = dir: it:
    let
      itDir = builtins.readDir ("${dir}/${it.name}");
    in
    attrsets.hasAttrByPath [ "pkg.nix" ] itDir && itDir."pkg.nix" == "regular";

  hasNvFetcher = name: attrsets.hasAttrByPath [ name ] nvfetcherOut;

  packages = scanPackages "${flakeInputs.self.outPath}/packages";

  buildPackage = dir: name:
    if (hasNvFetcher name) then
      (pkgs.callPackage "${dir}/${name}/pkg.nix" {
        source = nvfetcherOut."${name}";
      })
    else
      (pkgs.callPackage "${dir}/${name}/pkg.nix" { });

  scanPackages = dir:
    builtins.listToAttrs (
      map
        (it: {
          name = it.name;
          value = buildPackage dir it.name;
        })
        (filter (hasPkgFile dir)
          (filter dirOnly
            (attrsets.mapAttrsToList (name: value: { inherit name value; }) (builtins.readDir dir)))));

  isDerivation = package: normalPkgs.lib.attrsets.hasAttrByPath [ "drvPath" ] package;

  resultPackages = rec {
    inherit build-electron-appimage;

    # tools need to read global config
    libvirt-tools = import ../modules/services/libvirt/tools;
    libvirt-iso-library = pkgs.callPackage ../modules/services/libvirt/library.nix { };
    build-vm-qcow = pkgs.callPackage ./build-vm-qcow { };

    yesplaymusic = pkgs.callPackage ./yesplaymusic {
      inherit build-electron-appimage;
      source = nvfetcherOut.yesplaymusic;
    };

  } // systemPackages // packages;

  buildPacakges = (builtins.filter (it: isDerivation it.value) (pkgs.lib.attrsets.mapAttrsToList
    (name: value: {
      inherit name value;
    })
    resultPackages));

  buildPacakgesList = builtins.filter
    (item:
      let
        meta = pkgs.lib.attrsets.attrByPath [ "meta" "platforms" ] [ system ] item.value;
      in
      (pkgs.lib.lists.any (item: item == system) meta))
    buildPacakges;

  packageList = pkgs.writeText "packages.json" (builtins.toJSON (map (it: it.name) buildPacakgesList));
in
resultPackages // { inherit packageList; }
