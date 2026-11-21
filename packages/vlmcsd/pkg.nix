{
  stdenv,
  fetchurl,
  lib,
}:

stdenv.mkDerivation rec {
  pname = "vlmcsd";
  version = "1113-unstable-2023-07-28";

  src = fetchurl {
    url = "https://github.com/Wind4/vlmcsd/archive/70e03572b254688b8c3557f898e7ebd765d29ae1.tar.gz";
    sha256 = "sha256-NjtGJgiWBR8giF0+xICqVszuyB7A9et3lsDoCqJ6fv8=";
  };

  buildPhase = ''
    make vlmcsd FEATURES=full
  '';

  installPhase = ''
    mkdir -p "$out"/bin/
    install -m 755 bin/vlmcsd -t "$out"/bin/
  '';
}
