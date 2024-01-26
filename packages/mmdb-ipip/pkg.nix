{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "81624e65373eceb800c39f263731b4e6ee80b337";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-zZVW6No0WRohQB3gaZUelICx/X0ctQi+RZxejeHyhyA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
