{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601120303-unstable-2026-01-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "87f7ea862fff039691da982240bb84eb828aa184";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-565RBCCyOC53mf/C4jTvptzik7OFDEHTvc2yMRvYTQw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
