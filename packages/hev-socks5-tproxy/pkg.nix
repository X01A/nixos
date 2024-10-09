{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.5.7";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.5.7";
    fetchSubmodules = true;
    sha256 = "sha256-NUtiiy2IATbgT2tPocE39FwYsBS1QZBYgiF1tMiM/VI=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
