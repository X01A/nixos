{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410210310-unstable-2024-10-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ceb111897a0ea37c57ead8380bb4128d88e32899";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-eGfnhGo0DQw3kFfzFq4GBqqub/zMiIPsgBdAwpNm82A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
