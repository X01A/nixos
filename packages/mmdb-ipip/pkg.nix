{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603020306-unstable-2026-03-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "24cc0b50cbaed4c21f8b169a56c51114d2bd2843";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-qgqOqzTMmrC08cjHn7T6aTxvCZ2XwWgF/pBQFajQxes=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
