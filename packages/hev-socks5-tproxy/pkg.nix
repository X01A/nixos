{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.4.1";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.4.1";
    fetchSubmodules = true;
    sha256 = "sha256-/YIMLQvQTpGndvwQPSqfFkw1bY8LqIX8+oEwZj5AXO8=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
