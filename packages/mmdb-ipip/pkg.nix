{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410140312-unstable-2024-10-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "303697ccb22f926f6d6a82d0dc5479b0276b8752";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-kw7S/blllUX/gjzc2cyuOAA3sRlndiEGh5vZcUj/uEU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
