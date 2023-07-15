{ stdenv, glibc, fetchurl }:

stdenv.mkDerivation rec {
  pname = "alist";
  version = "3.22.0";
  src = fetchurl {
    url = "https://github.com/alist-org/alist/releases/download/v${version}/alist-linux-musl-amd64.tar.gz";
    sha256 = "sha256-ru7FBfWlJe0xjargdBkQcwV4lJhzXKReRpR18YHS6ac=";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 alist -t "$out"/bin/
  '';
}
