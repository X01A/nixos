{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406100310-unstable-2024-06-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "78f24751f74a6dbb6d5c97248ecb321f5d80604d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-yNVdHDzB7119ft9lTDosf+riabGsREbfsisi1VYLpFs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
