{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409160310-unstable-2024-09-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b0841313b819a377216d2d0e8efd0495767b57d1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-WbmUO7H4BzS+d4+VBWcr/Kj/DiJAeRDD6+zENw3amm8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
