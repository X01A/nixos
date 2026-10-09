{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610050610-unstable-2026-10-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f45fdaed164627784de226d971a22d87efc1b0c3";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-B55i0ztj3Drk200+3M/DTUllWMs+v/x/k8LfXV1tiGI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
