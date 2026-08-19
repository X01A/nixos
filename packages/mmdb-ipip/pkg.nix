{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608170306-unstable-2026-08-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ab5adecc608c53f12e27b060bc5d454753c75a64";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-whUlQLBi9giMoBmTbOTh+JUaiSx2SIlMtMIayiv4aH4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
