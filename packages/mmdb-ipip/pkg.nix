{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410210310-unstable-2024-10-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bcf5e811f880c8b1864335ae42874626d0c94c19";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-AtjAW2xgh4U98ARFu8cWOoPpjKphVikYe+3ZIJ/Mvjo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
