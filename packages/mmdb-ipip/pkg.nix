{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604200317-unstable-2026-04-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "897a1ddf0a49ae646ac9585baf3f62d913515171";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ZESHLND8ZwNfn4ES/2kPZl3FatN0EH0s/D7KPy5mpL8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
