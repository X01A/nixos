{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603020306-unstable-2026-03-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f4a95a74a78aed2bc8dbb2d005626c4fc4a4b7d7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Kf/MXUC62vZylBAVbsKbQ7bOuaEwlj5Z8Ay8ZGhXKdo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
