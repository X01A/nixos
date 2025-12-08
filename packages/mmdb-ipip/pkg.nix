{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512080303-unstable-2025-12-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b888ab5c4e33a56492cb93aec35fb164e1b6825d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TDW92eD+TzF99dyz84SIRmKxYoFsK3DiZEeGzrLrMtg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
