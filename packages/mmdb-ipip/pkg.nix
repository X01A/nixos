{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412230310-unstable-2024-12-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0213e7b5469677275e824fc99a72099b5481b9f6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vCFvKxyHLALZwodRimcJ0iPBFqGEN2IxV9EfeuFolgs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
