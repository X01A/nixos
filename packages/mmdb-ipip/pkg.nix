{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512220303-unstable-2025-12-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7ee69488ae9f4d01386d5fd0681d63d5e14b140d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BsBktaA+bHA0NEnOvBZQx5mmu2AK3y+4kB2iSgP1YMA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
