{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d2a13e4f2abd8ad06679b991116723b594ae2f42";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-sMSxhlfIwrJ4C5C/HUcHtqjzDzUdgUfcPyVX8BWINRc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
