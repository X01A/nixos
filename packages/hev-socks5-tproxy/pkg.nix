{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.5.1";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.5.1";
    fetchSubmodules = true;
    sha256 = "sha256-s+b92Em0OIqMWPE/N1PeYJwORWFkEmE33lRMDLeUQFE=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
