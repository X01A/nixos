{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412020310-unstable-2024-12-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "76953a0a329d1553f9fa1852c207aa0a2f606b70";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-npbQft2phv7f48ziXHl4xUktpmikEGHUHM4yi8+gGJY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
