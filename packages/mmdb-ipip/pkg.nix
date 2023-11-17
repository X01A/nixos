{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c7ea83358a006ba1f9fbf77de1fca2b1dbf45950";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-EFvBtBSbbk8T8SenrnBEht4XkyD0kBx4a2rHKackuMk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
