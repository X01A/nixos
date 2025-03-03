{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503030311-unstable-2025-03-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3817801eff6ae37d3e6e0e2618171b3e1b73f6f7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-odf+LEGP8a5BIIfGrKxyJ8Cp8aTA3vVRc6J/leu34/Q=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
