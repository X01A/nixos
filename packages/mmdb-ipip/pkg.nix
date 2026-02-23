{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602230308-unstable-2026-02-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "58a97ddd53b0785f5d6da0d0313a4fc27964f26b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7y9FF9JGOZXEZ6c81dBgUVZy9C/4Mdr4rtUOy8b7Uuo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
