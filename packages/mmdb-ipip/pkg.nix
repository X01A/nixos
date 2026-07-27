{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607270405-unstable-2026-07-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e0d29101c87e9fdf875b3fbb09995d47eaab2a77";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7xIkMAZ0YnAyTH2oDOEF6AKQzWFrNa2yFfgYlcjrvLw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
