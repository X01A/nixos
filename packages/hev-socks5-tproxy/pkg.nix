{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.5.3";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.5.3";
    fetchSubmodules = true;
    sha256 = "sha256-iQVz8XkuJJI8vZNatQWuLXKzUtxUg45xDz5iA9wDrwg=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
