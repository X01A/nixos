{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411040311-unstable-2024-11-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "295adadbe3891c64c312fff8596c407df4442d45";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-H9faGhzWW+Ox6HbfNemISORdzJkXQqQQQEJMGDcHv+o=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
