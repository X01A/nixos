{ stdenv, glibc, fetchurl }:

stdenv.mkDerivation rec {
  pname = "alist";
  version = "3.24.0";
  src = fetchurl {
    url = "https://github.com/alist-org/alist/releases/download/v${version}/alist-linux-musl-amd64.tar.gz";
    sha256 = "sha256-izCRQv4mLFvys4Rvy18SdAVoQDYegFRLNJh7HhKrdCk=";
  };

  phases = "installPhase";

  installPhase = ''
    tar zxvf $src
    mkdir -p "$out"/bin/
    install -m 755 alist -t "$out"/bin/
  '';
}
