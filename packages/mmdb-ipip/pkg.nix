{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609070306-unstable-2026-09-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "52adae77aaf78ad1d6bda0bd272db3c65a4955e6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Wv70yFVoc4tgz+trc3ZLT5YV7GkqgK5TcmsgKlJI79s=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
