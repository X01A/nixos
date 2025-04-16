{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504140311-unstable-2025-04-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e36967b84c295320600a3b24c7affcc1a1c99f02";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9+7ZPas0OKJTbnbIkJ8Ljy0WgwP4JeZPVCBl02wmvRM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
