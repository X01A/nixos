{ source, makeDesktopItem, electron, makeWrapper, appimageTools, stdenv }:


let
  appImage = appimageTools.extractType2 {
    inherit (source) src;
    name = "${source.pname}-${source.version}";
  };
in
stdenv.mkDerivation rec {
  inherit (source) pname version;

  src = appImage;
  nativeBuildInputs = [ makeWrapper ];
  desktopItem = makeDesktopItem {
    name = "yesplaymusic";
    exec = "yesplaymusic";
    icon = "yesplaymusic";
    desktopName = "YesPlayMusic";
    genericName = "YesPlayMusic";
    categories = "Network;";
    extraEntries = ''
      StartupWMClass=yesplaymusic
    '';
  };

  installPhase = ''
    # Asar
    mkdir -p "$out/share/yesplaymusic"
    cp -r resources/app.asar $out/share/yesplaymusic
    # Icon
    mkdir -p $out/share/icons/hicolor/128x128/apps/
    cp yesplaymusic.png $out/share/icons/hicolor/128x128/apps/
    install -Dm644 "${desktopItem}/share/applications/"* \
      -t $out/share/applications/
  '';

  postFixup = ''
    makeWrapper ${electron}/bin/electron "$out/bin/yesplaymusic" \
      --add-flags "$out/share/yesplaymusic/app.asar"
  '';

  distPhase = ":";
}
