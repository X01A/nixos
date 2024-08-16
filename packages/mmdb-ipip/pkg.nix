{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408120311-unstable-2024-08-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b2bce404fdcdd3a106f11c6ea2baf777a71a8fd1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-1sHz2v1G3IGoBf02gPRpsv+Ef+/JcDjJcoyJ5DjihAc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
