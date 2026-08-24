{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608240306-unstable-2026-08-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2cffdc17b1bbacf0447c949c9b484d410b845c16";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-bz16ZOFWNT6UgxNX76Mqrs5dcqUt5NYpFNxPgYhLeSk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
