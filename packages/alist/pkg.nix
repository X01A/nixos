{ stdenv, glibc, fetchurl }:

stdenv.mkDerivation rec {
  pname = "alist";
  version = "3.29.1";
  src = fetchurl {
    url = "https://github.com/alist-org/alist/releases/download/v${version}/alist-linux-musl-amd64.tar.gz";
    sha256 = "sha256-edhOOL0V3O+6FNBK1vxOQOiZYSAdqeZf/68zgPWxvEw=";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 alist -t "$out"/bin/
  '';
}
