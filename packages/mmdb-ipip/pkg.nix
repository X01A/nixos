{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601050303-unstable-2026-01-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bb6df81ffad91e4d05d2d7e37eda5b2b9e4eeaaf";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-0eUbrTiEckZI5dydnrKgZbfxEXRKO+SD34zzCUyTDzA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
