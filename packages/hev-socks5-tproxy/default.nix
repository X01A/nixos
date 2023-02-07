{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.3.4";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.3.4";
    fetchSubmodules = true;
    sha256 = "sha256-He0HXVxuPNGcujSTCf+5CmnRcirBHMUwc+Hh0A99+Fs=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
