{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602020308-unstable-2026-02-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e27ac7536efef884b093db37ac2f690894905708";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-CssiWNIgabkoElLbcemKKLA2LJ0kbE7QhppBRGF/P8g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
