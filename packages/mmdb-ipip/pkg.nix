{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512010303-unstable-2025-12-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e7bb3d5d35d0a03be7db11afd98cb8c68cd3f536";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-EM7BFBAH532mlA+UDXXxagnfYQDrkBV3RmnTMsAVz8A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
