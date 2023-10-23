{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4b99c1b7cd25984ba5d541076ad280eaceadb1b3";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7cM/iSzZRRcthZxvJ1I0MW8ConqfDxB68RnN1oFm6pg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
