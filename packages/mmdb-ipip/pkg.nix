{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6f2ad1d3c6fa3e617847d7e1451b7072e5503be7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-i6Gu/4wOO1xESf2OemexC/fC67D9n+uFfa4dvnAj4D8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
