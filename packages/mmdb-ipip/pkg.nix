{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604270319-unstable-2026-04-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "13880de2ee8ad3d0101086b8c7c1e7943fe30bc7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-iLYH43hj6dM6RNuFyv86SwKNqRK/OxkyrveursSgwvU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
