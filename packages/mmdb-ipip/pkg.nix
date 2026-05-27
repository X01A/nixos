{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605250330-unstable-2026-05-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "521353d9fe58df014670f12616f86750439190c5";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-61ch9XQVyX7wQfqG+Wn9RnuUUcfJe1EWUEZjaiWnz5s=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
