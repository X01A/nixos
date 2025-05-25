{ stdenvNoCC, fetchurl, lib }:

stdenvNoCC.mkDerivation rec {
  name = "reader-pro";
  version = "3.2.14";

  src = fetchurl {
    url = "https://github.com/hectorqin/reader/releases/download/v${version}/reader-pro-${version}.jar";
    sha256 = "sha256-sm+0dp1onZj/JkCM55onXXGfNgkGyErPUv9ATpgDDIw=";
  };

  phases = [ "buildPhase" ];

  buildPhase = ''
    cp $src $out
  '';
}
