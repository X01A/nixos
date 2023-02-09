{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-02-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ebac73726453d617b5191efb06050b0754347f72";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-K/BaAxi8zhUPe+BMCV2bF1q6jR5i5R+F3claFc0pLr4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
