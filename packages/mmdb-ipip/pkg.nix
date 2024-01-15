{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "42f4aadb6858cb1374945b644dd8d58ebed36914";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-6p5L9UxM3uQknOwsZtYW6rdjLbUtC9/5sFjzR0vTF6w=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
