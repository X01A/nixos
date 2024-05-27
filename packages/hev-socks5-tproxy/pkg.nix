{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.5.5";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.5.5";
    fetchSubmodules = true;
    sha256 = "sha256-dMwDnh/5ipyKvxkebHSkKPVPfMj3EoYJ10JMPJdT0r4=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
