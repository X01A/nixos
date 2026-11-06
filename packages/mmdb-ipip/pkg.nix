{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611020634-unstable-2026-11-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c0d3d952e8982be74773dab12856fc344db5f2f9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-68JgLRjBbVUkbcQrByt8Y4zh+rptySDFp+xRzEcbpjQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
