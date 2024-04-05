{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404010309-unstable-2024-04-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "707aa6fccdf8d848be99a73b74a66a3839804f86";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-AZIcSUBqvcX8jyEQmamN3I4kdnE1PueyECluq06kDvA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
