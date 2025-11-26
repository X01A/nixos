{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202511170302-unstable-2025-11-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "581bf9ad5c037a4f2dab3951ddb223d7b13a17c4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-94ILM2uX6/uJy0/WI6fIiLSPZmShb1+o3hKkorkffPM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
