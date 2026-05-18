{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605180327-unstable-2026-05-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "665acd034162aed03cb58d85fdb645077aa3f77b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-r0DlRyzOB4IapBXf7I6R6Cz3aerDQhNRe1vO/XVVJQ0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
