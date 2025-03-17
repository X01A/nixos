{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503170310-unstable-2025-03-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1497f87a0ca90ad57b5b25fe9e43bcd1120c0336";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-FwqO5KfkC8cDGGrq7L5auwWHO7pPx1nG+QSBxVe1O/4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
