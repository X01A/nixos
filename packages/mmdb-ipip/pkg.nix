{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410210310-unstable-2024-10-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f0ebb1eafb8c13e7b0c7db21022a35d4cd7e6766";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-YkWjeXJ+tKiOyermxw1liW5/iw1dNSt0UfmizBzHgyM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
