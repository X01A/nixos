{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605250330-unstable-2026-05-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "96edd29b27bd6b064429090fb04a631efda95c2b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-htinU6j5IBGTr/QBTGOyj4mePwjUxEztQ4sfgPbWjCk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
