{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "09f87fcd7f700cdd2d0f34c602e35713e09e3f38";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VBkJNdVMN158/Yr8ON/V669HOIt/qEjkNoD23SyI+s0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
