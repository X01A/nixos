{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609210509-unstable-2026-09-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1e2447c085dbaf553789c0819f1fd05f52d465a4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-d4VYx1fWRCF9ml7xZYy13msyNmCsZTbiQHy/hu9PacE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
