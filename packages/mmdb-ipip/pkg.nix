{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "10db8e5f009f8e9c7c911905bcede023176b5373";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-3/tZ3N+qjdZHaWkWLAXaWkwyai0ftdiE7oVtX4gmqbo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
