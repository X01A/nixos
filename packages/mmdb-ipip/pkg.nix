{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502030310-unstable-2025-02-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d95262ed200d34b9932f81c5308b02e4e937f2e3";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-aTUUAmN+C+HV2zTyk/OSEQrfkuFtW7I04ABfh2OrOuQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
