{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605040323-unstable-2026-05-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e6ef691622ae20983feb3cc7d9f32511ab32ee05";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-O08HKXJiT+MzARe68160eUPC6glrIaqSOSepuptnQf4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
