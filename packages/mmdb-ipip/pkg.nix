{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609140306-unstable-2026-09-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9591a64095f0b0e2c38bbd2de51d2925eddb2661";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vamXbO7kdVNIH13UvrqfaMiAmafEtFdtaxAOjRe7djU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
