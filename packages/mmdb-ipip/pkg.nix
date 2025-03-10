{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503100309-unstable-2025-03-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e87a436cb40f093cd9bd604b5b8a2001944110ff";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-mXe1DLm7yBtqT36PStvx9dS8u4w0iVFutsZ5bf4XKbk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
