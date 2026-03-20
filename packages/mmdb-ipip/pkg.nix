{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603160310-unstable-2026-03-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "32a0f5056f661e6736eb8e98b742bf403b3d847c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-EeZWrDCLjQhz3RkU2HFRmzi0fCl277qwxcJ5NwMkwR0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
