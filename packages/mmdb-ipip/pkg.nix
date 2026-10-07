{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610050610-unstable-2026-10-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6a82de3107a85c0a41df80e835b16b06375dce87";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-e67mzRUzX93LOP+uJrq5YZok0SAyv5ND0qgocVtZC58=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
