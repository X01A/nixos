{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608240306-unstable-2026-08-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "22e5024cf3d7a596c5c97096b8b777c616c1462a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-MhS9VMASE+y+socCKAiDqNhKElYhqibpL1TnuG1kMCI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
