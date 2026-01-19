{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601190303-unstable-2026-01-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1ee5e712c485170a8220bf260d1756913bc9d5de";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-F8s/97UAbg497nCCGhIRPfOH7i8SMHpXho8+7a9Ycdo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
