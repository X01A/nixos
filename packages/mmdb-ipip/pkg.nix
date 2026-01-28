{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601260303-unstable-2026-01-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d7cc8f6b36ff1505fc418f362736e446d33f0c0e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ba0gBePwsECMQ3fUPGkyYfJfnVfJfI2Pvx4Yyr7o+Fg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
