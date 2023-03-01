{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.4.0";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.4.0";
    fetchSubmodules = true;
    sha256 = "sha256-aV/UBGOi4021PKPt2PJNe6mmYUJc0sd2cSn2vOOFslw=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
