{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611020634-unstable-2026-11-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "66b9309d3e6d9f2d18ab661f5d971d049f42fa38";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-aD1fIMlJUVBnGb+GUA+W/5rX+QbJ9cmbwKEVBqugU1o=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
