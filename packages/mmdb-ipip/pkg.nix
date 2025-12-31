{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512290303-unstable-2025-12-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c57ac219b6d48d7f9d0b5b4aeae10e30aae35855";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-pyxEUGhypR43BTa4OS78yRoQ0lfwd3rBU8qOExHGjXo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
