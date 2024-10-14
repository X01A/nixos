{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410140312-unstable-2024-10-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "68f808ed65421009601f74ade220494bc09e4c82";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vg/RAVwXlXwcIZ1+E0jy68Z2BWagm5HjxFNy0FNM2sY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
