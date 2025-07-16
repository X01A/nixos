{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202507140313-unstable-2025-07-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fc0886fef33ac7bfe5dcb4ba95c033346facd585";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Cse1XDpr2c9PUX+K6g2D4V26iebEkb7T5eKt5tpMi+E=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
