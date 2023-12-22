{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4498694b740ccbed6e97de8d6c98c5dc7dbf33f6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-KVsCH+bIz1cpNMZPmB4zi0IAp6uiLG/LeASahRHqYB8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
