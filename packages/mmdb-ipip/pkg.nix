{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606290331-unstable-2026-06-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d25c84e61d2482ef224015e160d34fc923da2cc9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-SFjQDSZgc91T7NMpRPdm4n3tf7GvwWFYXbn4tmFwixo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
