{ nixpkgs, os, npmlock2nix, flakeInputs }:

with nixpkgs.lib;
with nixpkgs; let
  nvfetcherOut = callPackage ../sources.nix { };
  build-electron-appimage = callPackage ./build-electron-appimage { };
  osPkgPath = ./. + "/os-specific/${os}";
  systemPackages = if builtins.pathExists osPkgPath then callPackage osPkgPath { inherit nixpkgs nvfetcherOut; } else { };

  dirOnly = it: if it.value == "directory" then true else false;
  hasPkgFile = dir: it:
    let
      itDir = builtins.readDir ("${dir}/${it.name}");
    in
    attrsets.hasAttrByPath [ "pkg.nix" ] itDir && itDir."pkg.nix" == "regular";

  hasNvFetcher = name: attrsets.hasAttrByPath [ name ] nvfetcherOut;
  buildPackage = dir: name: if (hasNvFetcher name) then
    (callPackage "${dir}/${name}/pkg.nix" {
      source = nvfetcherOut."${name}";
    })
  else
    (callPackage "${dir}/${name}/pkg.nix" { });

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
{
  inherit build-electron-appimage;

  yacd = callPackage ./yacd {
    source = nvfetcherOut.yacd;
  };

  # tools need to read global config
  libvirt-tools = import ../modules/services/libvirt/tools;
  libvirt-iso-library = callPackage ../modules/services/libvirt/library.nix { };
  build-vm-qcow = callPackage ./build-vm-qcow { };

  yesplaymusic = callPackage ./yesplaymusic {
    inherit build-electron-appimage;
    source = nvfetcherOut.yesplaymusic;
  };

  motrix = callPackage ./motrix {
    inherit build-electron-appimage;
    source = nvfetcherOut.motrix;
  };

  # pufferpanel = callPackage ./pufferpanel {
  #   inherit npmlock2nix;
  # };

  # miui-auto-task = callPackage ./miui-auto-task/pkg.nix { };
} // systemPackages // (scanPackages "${flakeInputs.self.outPath}/packages")
