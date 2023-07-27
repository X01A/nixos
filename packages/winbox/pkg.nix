{ wineWowPackages, stdenv, fetchurl, makeDesktopItem, makeWrapper }:

let
  icon = fetchurl {
    url = "https://github.com/mriza/winbox-installer/raw/master/icons/winbox-128x128.png";
    sha256 = "1v5pgm4gq9a974zh5ij9sbajq87wdhd5lak7l4p09myvmh5vx1r5";
  };

  desktopItem = makeDesktopItem {
    name = "WinBox";
    exec = "winbox";
    icon = "winbox";
    desktopName = "WinBox";
    genericName = "WinBox";
    categories = [ "Network" "Utility" ];
  };
in
stdenv.mkDerivation rec {
  pname = "winbox";
  version = "3.39";
  src = fetchurl {
    url = "https://download.mikrotik.com/winbox/${version}/winbox64.exe";
    sha256 = "sha256-tP+YqjgYOUi+t4stUHe60RbRZrUg+Gm8+1k2gR/RHa0=";
  };

  unpackPhase = ":";
  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/win64
    install -m 755 $src $out/win64/winbox.exe

    makeWrapper ${wineWowPackages.stable}/bin/wine "$out/bin/winbox" \
      --add-flags "$out/win64/winbox.exe"

    # Icon
    mkdir -p $out/share/icons/hicolor/128x128/apps/
    cp ${icon} $out/share/icons/hicolor/128x128/apps/winbox.png
    install -Dm644 "${desktopItem}/share/applications/"* \
      -t $out/share/applications/
  '';

  meta.platforms = [ "x86_64-linux" ];
}
