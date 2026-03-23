{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603230308-unstable-2026-03-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9ca9185dc642f79fa03132a0ee4fa2b6ba903ed6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-nBwOi5PbMdVFz9G6y4Fpc1KVbqPZwN7PvzO5ZpW9lPQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
