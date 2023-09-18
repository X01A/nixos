{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-09-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "72e8697c911691f30d9a0dc971792a17dd8bd9e2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7U9Hd7uU1BqXp1TSWvbSzkSeHsdlOVsOQ9c/JUHiqwQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
