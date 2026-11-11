{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.14.0";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "${version}";
    fetchSubmodules = true;
    sha256 = "sha256-Ma0bMIdKOgeLxnYoBtM6uGbqg67yxmeuzKmc60WPMY0=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
