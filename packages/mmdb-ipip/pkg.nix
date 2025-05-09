{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505050312-unstable-2025-05-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c4e4c67dce3fc2e037855199448874643e2a009a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BkhlvN8pmffQg4puMPsShRofOY97YRIM6jBzH76XTdg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
