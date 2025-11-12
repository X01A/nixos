{ stdenv, glibc, fetchurl }:

stdenv.mkDerivation rec {
  pname = "cloudreve";
  version = "4.9.2";
  src = fetchurl {
    url = "https://github.com/cloudreve/Cloudreve/releases/download/${version}/cloudreve_${version}_linux_amd64.tar.gz";
    sha256 = "sha256-u7+TqiRb4lcEG5u+EJ/+51UlDU9lRgp8feXW295HGiA=";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 cloudreve -t "$out"/bin/
  '';
}
