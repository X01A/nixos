{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605110325-unstable-2026-05-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fd29b54a0891f373658504a9327f714c0d5b55fa";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-HB6PK2M9VDVfhI1Pap9HCYqRC+GedTrgkFJjCCT3fSQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
