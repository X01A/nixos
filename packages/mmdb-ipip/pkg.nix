{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608170306-unstable-2026-08-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a645e0807010cb4ce7c84f992e35d20687448868";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-DEjHrtT0bz/zj/B/kohElH3RN4v06bKKSY6MOzXAH8Q=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
