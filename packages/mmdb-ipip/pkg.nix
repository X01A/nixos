{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605250330-unstable-2026-05-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1f48c10d699d163f7b9c1660c461a8d8a9b02c7d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-tj8U2zGZ1CeNvGVi41tA4rjtx+TXq4p3rjAeKSCOa+0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
