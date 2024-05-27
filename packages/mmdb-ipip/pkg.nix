{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405270309-unstable-2024-05-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "76d797c155942fd76e7289cbc6632faaf56f6f7f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vc5E7mMzj+P4fFOM81MlE63+Xjyx42vaAwNv41LGxp0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
