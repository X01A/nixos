{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412020310-unstable-2024-12-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7c619a70bd026bda06fd02aec81b2bd6eff563b7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4Dq4emzMW6adG48ZSutx+0WgoHU3n0P3TKd7tOUGZho=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
