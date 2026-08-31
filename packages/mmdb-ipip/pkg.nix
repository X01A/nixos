{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608310306-unstable-2026-08-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "126092c809cd46cdb6e85a536e6b1ac9bb409616";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BsbXhgyReKLBlJku0UDMtdcPojka+xrtvNk8/FqFE5M=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
