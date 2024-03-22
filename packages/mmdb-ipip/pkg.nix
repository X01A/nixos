{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202403180308-unstable-2024-03-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "522ff77846d1439f0478fb911df9c3bf1066b3ac";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-1pIi+byDHhlfa1Dj94qVJQpaGTY0SnuZzl1WXEiiuDs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
