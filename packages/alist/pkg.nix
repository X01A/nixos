{ stdenv, glibc, fetchurl }:

stdenv.mkDerivation rec {
  pname = "alist";
  version = "3.12.2";
  src = fetchurl {
    url = "https://github.com/alist-org/alist/releases/download/v${version}/alist-linux-musl-amd64.tar.gz";
    sha256 = "sha256-doUJfRUt1zR7mkOB06lOkWV/qQmDPx7SLBbpXn298CM=";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 alist -t "$out"/bin/
  '';
}
