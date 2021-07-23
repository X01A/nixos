{ source, stdenv, meson, ninja, glib, gettext }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;
  uuid = "desktopicons-neo@darkdemon";

  preBuildPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/
  '';

  buildInputs = [ gettext ];
  nativeBuildInputs = [
    meson
    ninja
    glib
  ];
}
