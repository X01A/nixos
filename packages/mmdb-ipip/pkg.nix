{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503310311-unstable-2025-04-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c85daf349f4073804f3c086fde2bc69c0eab8c87";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-zGU6y/9V2Qw4fMNMBfrwElEoAlXEQB4FrAI5PLxPEs4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
