{ stdenv, source, glibc }:

stdenv.mkDerivation {
  inherit (source) pname version src;

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 cloudreve -t "$out"/bin/
  '';
}
