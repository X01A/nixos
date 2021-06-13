{ stdenv, fetchgit, source }:

stdenv.mkDerivation rec {
  inherit (source) pname version src;

  installPhase = ''
    mkdir -p $out/bin/
    install -m 755 microsocks -t $out/bin/
  '';
}
