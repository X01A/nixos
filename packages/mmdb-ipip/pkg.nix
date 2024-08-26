{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408260311-unstable-2024-08-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "940200f33c8cdee9099e0f9039a7fc7447e2c5b2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-6Lkj6/s4s8hxWIukfTLw1G5KZcaSHAwGFnwK0WWRQwM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
