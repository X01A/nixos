{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.9.0";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.6.0";
    fetchSubmodules = true;
    sha256 = "sha256-vunuMpQInB390rUJ4C1pLvLTtEJozU9Mtk9cUr0gJ3k=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
