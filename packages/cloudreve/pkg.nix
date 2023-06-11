{ stdenv, glibc, fetchurl }:

stdenv.mkDerivation rec {
  pname = "cloudreve";
  version = "3.8.0";
  src = fetchurl {
    url = "https://github.com/cloudreve/Cloudreve/releases/download/${version}/cloudreve_${version}_linux_amd64.tar.gz";
    sha256 = "sha256-45VWvyLqkjDEAKzp4NMhxegD7SvJs5j+oswo3mknxWw=";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 cloudreve -t "$out"/bin/
  '';
}
