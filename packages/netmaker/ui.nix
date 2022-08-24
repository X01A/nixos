{ source, unzip, stdenvNoCC }:

stdenvNoCC.mkDerivation {
  inherit (source) pname version src;

  phases = "installPhase";
  installPhase = ''
    mkdir -p $out
    ${unzip}/bin/unzip $src -d $out
  '';
}
