{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4b4e1772737ff7d74d9b89a39b6b8dbccaf070c0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-eekBxVcHKkRJRiIrH9ggV31O2EPZz2EVctIuD+A96Qw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
