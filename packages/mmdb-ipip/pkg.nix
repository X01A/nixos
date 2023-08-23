{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2be1212bdeadb680d136cd2419c2f1ae6a18f073";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-KDl0B+1dEA188sRKszns4UmWzbQcsu5yZtOsDL+GaIc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
