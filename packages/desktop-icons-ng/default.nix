{ source, stdenv, meson, ninja, glib, gettext }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;
  uuid = "ding@rastersoft.com";

  preBuildPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/
  '';

  postFixup = ''
    cd $out/share/gnome-shell/extensions/${uuid}
    chmod +x *.js
  '';

  buildInputs = [ gettext ];
  nativeBuildInputs = [
    meson
    ninja
    glib
  ];
}
