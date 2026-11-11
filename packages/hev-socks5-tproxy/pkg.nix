{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.13.1";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "${version}";
    fetchSubmodules = true;
    sha256 = "sha256-YRtoCYE5vpIjmw516Ddng5s0zY7ptzlY6sdnWy4zU6Y=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
