{ stdenvNoCC, fetchurl, lib }:

stdenvNoCC.mkDerivation rec {
  name = "reader-pro";
  version = "3.0.3";

  src = fetchurl {
    url = "https://github.com/hectorqin/reader/releases/download/v${version}/reader-pro-${version}.jar";
    sha256 = "sha256-XfVh+Sj2lR9Vk+ceH5UTjH7B79J3fgN88wwNbEGfEjI=";
  };

  phases = [ "buildPhase" ];

  buildPhase = ''
    cp $src $out
  '';
}
