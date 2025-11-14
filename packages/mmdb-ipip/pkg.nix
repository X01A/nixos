{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202511100302-unstable-2025-11-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4520b5772e24e623110ad7919a6751c9435cda82";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-aLSrwOjCJKKoHLOo18OxSFGiXfmw4BKVwqPhpwXZFdw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
