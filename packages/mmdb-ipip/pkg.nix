{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610050610-unstable-2026-10-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0c4009fe54b2fce7a641b6f7ad7774c60b49dcb3";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TEkRuYuaUxFXV4NFFAxwbzZx7C6YiqeyZoeSYI7hpxk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
