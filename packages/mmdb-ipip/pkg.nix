{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407290309-unstable-2024-07-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4f51fdcc807e0cfc0aa5c01a056cfeb6c32ba7bf";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-llNY3zcL5FdnOgDUn/Jyg5jHN2NQnl6AagTSv2o/pfQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
