{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202507140313-unstable-2025-07-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "978bca9340cada719fb49168d3ecc321f9a3cde5";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-2oAeDOOehlwbhHo4hxXOi1bL9lvpbBxqfm+QMdEARzQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
