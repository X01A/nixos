{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501130310-unstable-2025-01-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7d4c4df3d335b67d1fc74f564cca3d8f5516e1a0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LsSX4VK4UBZORPsb+n/4adBpVM8oN82mhvTcg5sJma0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
