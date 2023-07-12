{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "591825da9ee807451e90f7f2543de4dce2fc1094";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LKuuxH2ZtE/r4iCxWHEE/l6Ib5UucxwWg4Ze7Op2/8U=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
