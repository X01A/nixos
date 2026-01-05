{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601050303-unstable-2026-01-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5f0e28f331d9a34a64569df8979a69e3e6e104c3";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-nlG6RDr34oMz4YScSsta4poS6IU7/Uav00fWBGA08UU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
