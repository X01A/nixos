{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407220309-unstable-2024-07-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8d9191c06763f768403a18e7abd1b216193d9c66";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-uZQnmIyTwsUznrX0xoSJiBfSLGy0XVOzI42lo4Kqj/o=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
