{
  stdenv,
  glibc,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "cloudreve";
  version = "4.10.1";
  src = fetchurl {
    url = "https://github.com/cloudreve/Cloudreve/releases/download/${version}/cloudreve_${version}_linux_amd64.tar.gz";
    sha256 = "sha256-tNZg+ocgr65vyBkRDQhyX0DmLQuO0JwbXUzTeL4hSAc=";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 cloudreve -t "$out"/bin/
  '';
}
