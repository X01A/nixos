{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501060310-unstable-2025-01-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0f654f8ff96a98c056002143112ca82d57886745";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ehisrJxcdd2Rrf7qA5Kt9zdQEW/pkAbzR+TVs/W+jOA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
