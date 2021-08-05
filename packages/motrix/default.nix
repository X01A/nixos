{ source, makeDesktopItem, build-electron-appimage }:

build-electron-appimage {
  inherit source;
  icon = "motrix.png";

  desktopIcon = makeDesktopItem {
    name = "Motrix";
    exec = "${source.pname}";
    icon = "motrix";
    desktopName = "Motrix";
    genericName = "Motrix";
    categories = "Network;";
  };

  postInstall = ''
    cp -r resources/engine $out/share/${source.pname}
  '';
}
