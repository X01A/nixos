{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608310306-unstable-2026-09-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9f5a118d2e7b04a52eca3ac137985f44e9484752";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-jh6Rj1geuKBjr0ryI6NHagloTrjhji8oQXXZu+xNe4M=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
