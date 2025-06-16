{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506160312-unstable-2025-06-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1af1a3836d3656f077baed571efada2da7558fac";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-wTxa4lYU0QBvvb6qgi5NNmEe7uoySJn1fJwNjUkFG70=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
