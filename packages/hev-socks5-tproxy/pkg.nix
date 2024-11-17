{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.5.8";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.5.8";
    fetchSubmodules = true;
    sha256 = "sha256-7UQJSB3Yoj3dUHmyP3DuTK5r80YSso08BpyexvG24rw=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
