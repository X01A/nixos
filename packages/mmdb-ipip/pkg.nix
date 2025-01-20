{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501200309-unstable-2025-01-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8d9784d3f22f189fd0d5c9d3e16333f492947909";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VJfF1cFNfaN5R3K0yCU/9087O5UZsRBSua5Bfnecek0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
