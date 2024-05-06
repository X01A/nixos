{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405060310-unstable-2024-05-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "cac6fd8882e2e161202ea510b3121da6783ace48";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-KG0ocTBDbY4ifUkatj0bSVCPKsFPiKwrNq+S4XfDsQU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
