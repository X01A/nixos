{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-03-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "38b676a48b94f154cdae4de88b9aae489d1b002f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-GGDnnE+TN2Uo1iUjBjR/w+o/+eOIckOUUaEqpmjbWFk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
