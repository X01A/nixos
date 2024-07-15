{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407150311-unstable-2024-07-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "db0e244b4b61eed01b3a31ffe1a0a195b857e360";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-yi5gfIx4UxHIRh0r/lpIKYdIbo+SQd0RyWJoKQ4oLoM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
