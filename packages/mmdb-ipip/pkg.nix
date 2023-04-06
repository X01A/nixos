{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d82a761030ab0aba8a3fa5d55662af5eb77e7c6d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-0uxlEMveJhqqECyS8FQ85qyySRA0UfzTHjpYGi33+t8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
