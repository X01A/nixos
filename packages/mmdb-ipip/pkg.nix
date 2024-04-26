{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404220310-unstable-2024-04-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4e387ef4c0f3e45e95bf6b7ea2448f7ec013bcce";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-pxaY8hmrFXhIqNx2CyZcOdnYjNnMOhcCsS5oEgdDNSk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
