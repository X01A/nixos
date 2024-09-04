{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409020310-unstable-2024-09-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ee960f61507095e3ff2ec4742b0c1f0e2a937bdd";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-CZ8RW6ngMVMwrJNUnnoPvSVCvr86YqDSiVjqSPu5r90=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
