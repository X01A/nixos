{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202507210313-unstable-2025-07-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "30d858e874815999769fff9c82ac239a5023c7ec";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LvvasEwF5Ig+SEWF9UpnSxU8WvtwJAq1XrJdvKCkAgc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
