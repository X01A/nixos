{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505190312-unstable-2025-05-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9d2518f0c883793bcd204c567189f8c26448ffdf";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-oK3aCaPn7A7G2nv2XSTjqWpx832P+7VtfX0IbevPLPM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
