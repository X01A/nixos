{ source, makeDesktopItem, build-electron-appimage }:

build-electron-appimage {
  inherit source;
  icon = "yesplaymusic.png";

  desktopIcon = makeDesktopItem {
    name = "yesplaymusic";
    exec = "yesplaymusic";
    icon = "yesplaymusic";
    desktopName = "YesPlayMusic";
    genericName = "YesPlayMusic";
    categories = "Network;";
  };
}
