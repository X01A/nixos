{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "hev-socks5-tproxy";
  version = "2.5.4";
  src = fetchFromGitHub ({
    owner = "heiher";
    repo = "hev-socks5-tproxy";
    rev = "2.5.4";
    fetchSubmodules = true;
    sha256 = "sha256-Q7ORKuc/clfPIlcraR8DPRVkE7uwA3JnvGQD8D0OsT0=";
  });

  makeFlags = [
    "INSTDIR=${placeholder "out"}"
  ];
}
