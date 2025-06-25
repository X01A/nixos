{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506230312-unstable-2025-06-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2b0cc6ddddecbe0572c8516640b7d01136d25323";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-3Bapj1oWKxRn+LzUl/0OjA/g8lbQ802YoyVPTcljSCM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
