{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8262881f0cb620a3cf1847d418f6d962741f1613";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-WkdlQUq+0tNPSsNayF2P5syIjkyHIzwQwPNzd72nVuI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
