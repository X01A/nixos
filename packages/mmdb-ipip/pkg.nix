{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503170310-unstable-2025-03-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "96d071e12ca5823022540d932ffa000c3e91fe2f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-xMs6tKDizY3xudwx1aLKeDMihOJ/O9y2SCqRsnUAm50=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
