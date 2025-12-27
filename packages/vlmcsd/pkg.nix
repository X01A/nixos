{
  stdenv,
  fetchurl,
  lib,
}:

stdenv.mkDerivation rec {
  pname = "vlmcsd";
  version = "1113";

  src = fetchurl {
    url = "https://github.com/Wind4/vlmcsd/archive/svn1113.tar.gz";
    sha256 = "62f55c48f5de1249c2348ab6b96dabbe7e38899230954b0c8774efb01d9c42cc";
  };

  buildPhase = ''
    make vlmcsd FEATURES=full
  '';

  installPhase = ''
    mkdir -p "$out"/bin/
    install -m 755 bin/vlmcsd -t "$out"/bin/
  '';
}
