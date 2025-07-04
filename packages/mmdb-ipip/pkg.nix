{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506300312-unstable-2025-07-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4c90694a790bb16ff62499f5e84b6a5728d186d2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-86gEYRGjuRS94oW9l8P8PcNDY14b5cXCKBIgJI58CU0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
