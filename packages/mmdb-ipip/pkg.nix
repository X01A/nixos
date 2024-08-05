{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408050310-unstable-2024-08-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3851b2c6830314f15aeaf16c57768e4e362d7f8b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-uutK8T+CbCuYHGxv3dynyFmPGTjxiuqEKVQe15jItUE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
