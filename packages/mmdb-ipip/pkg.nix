{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410280312-unstable-2024-10-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6d4a8e869dc45c3ee76170a070eec49b1964e236";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-qSStwSX2AVvyWJLVzx4T7+HbCy3EJjOVL0OybDd4Dno=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
