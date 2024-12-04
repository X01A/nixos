{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412020310-unstable-2024-12-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bf4f967bc22a9bf0d4c8e343c1db07731582d50d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-1JHSPYiLqsk7ea3lzsYIX+a+c4lF12Kan2nng13xF70=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
