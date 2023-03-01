{ pkgs, normalPkgs, os, npmlock2nix, flakeInputs }:

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

in
rec {
  inherit build-electron-appimage;

  # tools need to read global config
  libvirt-tools = import ../modules/services/libvirt/tools;
  libvirt-iso-library = pkgs.callPackage ../modules/services/libvirt/library.nix { };
  build-vm-qcow = pkgs.callPackage ./build-vm-qcow { };

  yesplaymusic = pkgs.callPackage ./yesplaymusic {
    inherit build-electron-appimage;
    source = nvfetcherOut.yesplaymusic;
  };

  motrix = pkgs.callPackage ./motrix {
    inherit build-electron-appimage;
    source = nvfetcherOut.motrix;
  };
} // systemPackages // packages
