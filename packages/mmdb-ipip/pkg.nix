{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504280312-unstable-2025-04-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "72cc4ad5e4d3100ffd67b1f518a7bc4ce13412ba";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-pOCK7wiwavVba5p4JmpYeAlrcZSvJ0//4Q01NhSWHIk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
