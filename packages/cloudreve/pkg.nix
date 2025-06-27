{ stdenv, glibc, fetchurl }:

stdenv.mkDerivation rec {
  pname = "cloudreve";
  version = "4.1.0";
  src = fetchurl {
    url = "https://github.com/cloudreve/Cloudreve/releases/download/${version}/cloudreve_${version}_linux_amd64.tar.gz";
    sha256 = "sha256-HNr2UY6lpgGVw4RKE53ysPlJc01N863N81LXCXOJO2w=";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 cloudreve -t "$out"/bin/
  '';
}
