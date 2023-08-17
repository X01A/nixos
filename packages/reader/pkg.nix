{ stdenvNoCC, fetchurl, lib }:

stdenvNoCC.mkDerivation rec {
  name = "reader-pro";
  version = "3.2.5";

  src = fetchurl {
    url = "https://github.com/hectorqin/reader/releases/download/v${version}/reader-pro-${version}.jar";
    sha256 = "sha256-lFoSEMCTUKEvjJS9H7jA6/ymKtjjAuuCFT1+DSAzP7k=";
  };

  phases = [ "buildPhase" ];

  buildPhase = ''
    cp $src $out
  '';
}
