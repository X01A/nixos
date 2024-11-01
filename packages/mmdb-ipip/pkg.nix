{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410280312-unstable-2024-10-31";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "051134d5dacbe8823e22d82a258eb493aebf307e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-1N6pE4v4wRQg2xcn1XxXAxFzqoVN3pHNn0txhwPsR+g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
