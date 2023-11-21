{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.5.2";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.5.2";
    fetchSubmodules = true;
    sha256 = "sha256-AtJXSPFSI0JmX7XXpnqJgdrXJfXJa+F3PyMOn02NDiA=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
