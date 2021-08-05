{ stdenv, fetchurl, lib, dbus, xorg, openssl, udev, libva, libpulseaudio, libGL, alsaLib, makeDesktopItem }:

let
  parsecIcon = fetchurl {
    url = "https://github.com/flathub/com.parsecgaming.parsec/raw/master/com.parsecgaming.parsec.png";
    sha256 = "EUR9EJg9mgEr8kWXm7hTICdDF1xem8TEQumppaRL5Mk=";
  };
  desktopItem = makeDesktopItem {
    name = "Parsec";
    exec = "parsecd";
    icon = "parsec";
    desktopName = "Parsec";
    genericName = "Parsec";
    categories = "Network;Game;Utility;";
  };
in
stdenv.mkDerivation {
  pname = "parsec";
  version = "2021-01-12";

  src = fetchurl {
    url = "https://builds.parsecgaming.com/package/parsec-linux.deb";
    sha256 = "1hfdzjd8qiksv336m4s4ban004vhv00cv2j461gc6zrp37s0fwhc";
  };

  # The upstream deb package is out of date and doesn't work out of the box
  # anymore due to api.parsecgaming.com being down. Auto-updating doesn't work
  # because it doesn't patchelf the dynamic dependencies. Instead, "manually"
  # fetch the latest binaries.
  latest_appdata = fetchurl {
    url =
      "https://builds.parsecgaming.com/channel/release/appdata/linux/latest";
    sha256 = "0s8qfk865ip5vsdrvr74l2dgjkhzynbkvzfbyp3gy3pb9d85bb7r";
  };
  latest_parsecd_so = fetchurl {
    url =
      "https://builds.parsecgaming.com/channel/release/binary/linux/gz/parsecd-150-72.so";
    sha256 = "0nq78zy9mx9jq0aw28gkpnc1jf6bskl8lpsds5zm45xsmnx1vpli";
  };

  postPatch = ''
    cp $latest_appdata usr/share/parsec/skel/appdata.json
    cp $latest_parsecd_so usr/share/parsec/skel/parsecd-150-72.so
  '';

  runtimeDependencies = [
    alsaLib
    (lib.getLib dbus)
    libGL
    libpulseaudio
    libva.out
    (lib.getLib openssl)
    (lib.getLib stdenv.cc.cc)
    (lib.getLib udev)
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXinerama
    xorg.libXrandr
    xorg.libXScrnSaver
  ];

  unpackPhase = ''
    ar p "$src" data.tar.xz | tar xJ
  '';

  installPhase = ''
    mkdir -p $out/bin $out/libexec
    cp usr/bin/parsecd $out/libexec
    cp -r usr/share/parsec/skel $out/libexec
    # parsecd is a small wrapper binary which copies skel/* to ~/.parsec and
    # then runs from there. Unfortunately, it hardcodes the /usr/share/parsec
    # path, and patching that would be annoying. Instead, just reproduce the
    # install logic in a wrapper script.
    cat >$out/bin/parsecd <<EOF
    #! /bin/sh
    mkdir -p \$HOME/.parsec
    ln -sf $out/libexec/skel/* \$HOME/.parsec
    exec $out/libexec/parsecd
    EOF
    chmod +x $out/bin/parsecd

    # Icon
    mkdir -p $out/share/icons/hicolor/128x128/apps/
    cp ${parsecIcon} $out/share/icons/hicolor/128x128/apps/parsec.png
    install -Dm644 "${desktopItem}/share/applications/"* \
      -t $out/share/applications/
  '';

  postFixup = ''
    # We do not use autoPatchelfHook since we need runtimeDependencies rpath to
    # also be set on the .so, not just on the main executable.
    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
        $out/libexec/parsecd
    rpath=""
    for dep in $runtimeDependencies; do
      rpath="$rpath''${rpath:+:}$dep/lib"
    done
    patchelf --set-rpath "$rpath" $out/libexec/parsecd
    patchelf --set-rpath "$rpath" $out/libexec/skel/*.so
  '';
}
