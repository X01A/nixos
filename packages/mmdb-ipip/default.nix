{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-02-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1c5c3a1ec1ec8bb6bc1c5e97bb8123083b6d2c37";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Ns2lZyRMsnrbrdhELvVIK3FHz2Nm29i64x1XY/b7LbY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
