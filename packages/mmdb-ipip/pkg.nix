{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502240310-unstable-2025-02-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "08643dd267d9fc7c470535d75d27b46c4edf920a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-f5gSXcQI1MkG2VvlmreOuF5tqnqiywo+gNAm/U15KAc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
