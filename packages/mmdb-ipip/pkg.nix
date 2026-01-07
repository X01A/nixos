{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601050303-unstable-2026-01-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d0a5d8e5522bf3aaec0a8bce631e5eefcebf0334";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BKwtk9dBtRgYkS/OA5dfTbnI7h3ZfQ3a0gfZ+lPUc0A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
