{ stdenvNoCC, fetchurl, lib }:

stdenvNoCC.mkDerivation rec {
  name = "reader-pro";
  version = "3.0.5";

  src = fetchurl {
    url = "https://github.com/hectorqin/reader/releases/download/v${version}/reader-pro-${version}.jar";
    sha256 = "sha256-ILugGSNvmnHeN/W38XSROq4EZiDqUxJIeU88p2hZqdQ=";
  };

  phases = [ "buildPhase" ];

  buildPhase = ''
    cp $src $out
  '';
}
