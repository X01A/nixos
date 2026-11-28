{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611230758-unstable-2026-11-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "31ad9a0682bf7d948f796218b3cd185a366c04d6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-T8Yn8Poh12RBwr21318SkWClQNGu3jhk723wcjcBUUw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
