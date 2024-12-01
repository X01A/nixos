{ stdenvNoCC, fetchurl, lib }:

stdenvNoCC.mkDerivation rec {
  name = "reader-pro";
  version = "3.2.11";

  src = fetchurl {
    url = "https://github.com/hectorqin/reader/releases/download/v${version}/reader-pro-${version}.jar";
    sha256 = "sha256-MawPiynFzVy0l2Eui0DEbEDnJSGyKhWgkHMGKfVKyLY=";
  };

  phases = [ "buildPhase" ];

  buildPhase = ''
    cp $src $out
  '';
}
