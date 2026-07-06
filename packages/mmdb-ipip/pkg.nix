{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607060410-unstable-2026-07-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "73ff57ef6ecb24ddf89443131fa0eb49ab069118";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-SAcPJ9PfHt4INg1QFEkwws2+5IIQufy9xRKc2LeJ6g0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
