{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408190310-unstable-2024-08-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d4f30966821caf467d9f633051a30e6e726f7d4d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-EnEo/OJqD6/gdpw3vx8W9OxVeX5EihIUvvPQ36R8cE4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
