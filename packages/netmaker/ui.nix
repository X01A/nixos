{ source, unzip, stdenvNoCC }:

{ backend }:

stdenvNoCC.mkDerivation {
  inherit (source) pname version src;

  phases = "installPhase";
  installPhase = ''
    mkdir -p $out
    ${unzip}/bin/unzip $src -d $out
    echo "window.REACT_APP_BACKEND=\'${backend}\'" > $out/config.js
  '';
}
