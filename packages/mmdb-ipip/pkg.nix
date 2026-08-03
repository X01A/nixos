{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608030407-unstable-2026-08-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b6e1350a5f9d66ccc97e7ec08592dc39cea6dded";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ngey3eziEq+CjF95Nv7aDt56bKuVW/RgLpaej4ygLCM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
