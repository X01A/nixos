{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609210509-unstable-2026-09-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6da06bcd760c78ef5ade39f2c82aa87b03d14fd5";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-QGTp3VqDzWbuCdsrtoTM1cRZLZvTDKntfjqAliCNw9c=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
