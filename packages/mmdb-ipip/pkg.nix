{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602160308-unstable-2026-02-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fdd9ea6d93b6adf84d7934e0e1cbf3ebf0434fb9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-RW37Oq3Vmrmm9qnfusJcw+nKgDSs9/N8/Gb9FY35fYM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
