{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504280312-unstable-2025-04-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1f9c27a0129eb515175434a632121e616a83cf9b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-hOM0ai5XjiK25I63MYq4AHBUUs/uofedVLQIFwq6Ilc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
