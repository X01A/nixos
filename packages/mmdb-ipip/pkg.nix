{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406100310-unstable-2024-06-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1503be191fe4971c01775ec77e0ae1e78b03720d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-FLAlT6UuUYgv2nW2CFU/MSdKlSLLeY48PdYGrFKbDlM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
