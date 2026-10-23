{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610190513-unstable-2026-10-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fa049a8d083073de5f02f65dc2a9664127b51aca";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-1icLLg9qf5/PCXfoHuqJiehPN/xfZW2gmL0xhMaXZnI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
