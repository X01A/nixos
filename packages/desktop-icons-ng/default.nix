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
    mv $out/share/locale/ $out/share/gnome-shell/extensions/${uuid}/
    mv $out/share/gsettings-schemas/*/glib-2.0/schemas $out/share/gnome-shell/extensions/${uuid}/
    rm -rf $out/share/gsettings-schemas/
    rm -rf $out/share/glib-2.0/
  '';

  buildInputs = [ gettext ];
  nativeBuildInputs = [
    meson
    ninja
    glib
  ];
}
