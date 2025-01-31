{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501270310-unstable-2025-01-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f342497ee3daf7fcf4bb92cd2ecdb0acd91a0d25";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Z+P0HtQX89oXsX+fQVyAxMf7dL/yoa8Lx6UJCttY1js=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
