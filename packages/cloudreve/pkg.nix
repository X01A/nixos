{ stdenv, glibc, fetchurl }:

stdenv.mkDerivation rec {
  pname = "cloudreve";
  version = "4.5.1";
  src = fetchurl {
    url = "https://github.com/cloudreve/Cloudreve/releases/download/${version}/cloudreve_${version}_linux_amd64.tar.gz";
    sha256 = "sha256-IIHtQ0OQeBUoJ/u5n8Z9uEBqxZ3hUBb3S5Iw0W9g0Hw=";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 cloudreve -t "$out"/bin/
  '';
}
