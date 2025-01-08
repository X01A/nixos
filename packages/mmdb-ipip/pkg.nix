{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501060310-unstable-2025-01-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "aeeb252bd588bb01c5421ba2d9287770a53333b0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-bqNPYS1KTlBxLfQ0OVFEJeOMxVXq7V+EA6TX+JTBahk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
