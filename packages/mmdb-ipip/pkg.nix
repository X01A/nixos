{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603300313-unstable-2026-03-31";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d1554149f097fe839a2783c7dc2a0754716e5bc0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9Dpb8WGqfH0uYmsZAT4GEiu0h6jISvwyJnTEvp9yPzY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
