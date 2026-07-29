{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607270405-unstable-2026-07-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "365cd3b7fdfe7456bd9bb34d9260b71bd1906e54";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-adgvAJApYsyqJiyQXS+0ya16EscAb6racPd3NSLoJ94=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
