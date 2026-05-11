{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605110325-unstable-2026-05-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "955d0f83355cea903564c0b580e9523543bf6fd4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-i7Js5JZ+JON+0CFMEK8wyZIqDb17ceCMbqxgOl//e0s=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
