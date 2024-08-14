{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408120311-unstable-2024-08-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a4d7d2d66fa7d664d76cec1d843caac81424806f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Ais0CbFatKRY0YIeDH3lSrtkaSVyA0Y4MNsPUWYXT00=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
