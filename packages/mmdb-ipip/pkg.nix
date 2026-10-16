{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610120639-unstable-2026-10-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "18568197675be0808b305dcdb6065e3c5aa553ea";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-K/vj3xF2O17opnPZIWUbY4+qiXJPLvYR2yp1eA0dXgs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
