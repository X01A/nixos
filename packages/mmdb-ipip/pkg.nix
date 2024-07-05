{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407010309-unstable-2024-07-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "cf3ab3ccc7ad7b298f6b3e4f508d1532e60b5171";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Nf+aj9ZX/XSxBz0q1b12PQfqOHbwWOZBiw4xB7GGI1k=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
