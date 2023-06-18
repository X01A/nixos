{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "04332cb3a140e06994fb0e8bb4ebe70996ccf0c3";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-uFr2Bb/AfGDDlvXvzcQf1sWJLs0becaL19bxf7yYH3E=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
