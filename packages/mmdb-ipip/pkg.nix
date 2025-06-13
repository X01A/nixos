{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506090312-unstable-2025-06-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d87268ce3cfd5ed6850b0ea8d971febda1f066fa";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-/O9YotCEO5OebmpFEPGdDzKls7ItxhblkyzyHudPDxM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
