{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412230310-unstable-2024-12-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "29c12d905c2e1c150c9dcc317ef1587d4b1be49b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-bDkHqM4pQMpE4k9oaLagxzRQfohBDt9P3gsjlzH8Hhs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
