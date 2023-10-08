{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.5.0";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.5.0";
    fetchSubmodules = true;
    sha256 = "sha256-VrZvQTS94SFqivcOQcFbbWCbrIXMMQvoKkHvzHjx7OU=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
