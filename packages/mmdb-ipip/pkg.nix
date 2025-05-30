{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505260312-unstable-2025-05-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3b452fb2e8695ea9b910819cc08bc187342b05e4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-V9IDG+i+jAiSoNLzMfztOwPk5gD/k4t9ZNxSVjmuOZs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
