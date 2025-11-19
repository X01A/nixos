{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202511170302-unstable-2025-11-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "42fecf0bafb762f0435eb5aa9124587ae6f001fd";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-8kwGgzMUssN0nu1P5WINmTMpJgWbNSCwhEhmFTQHZPo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
