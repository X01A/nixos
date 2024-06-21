{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406170311-unstable-2024-06-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ee9e0e4b49d413550d9401b83fdd085c040b7d3c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-QYTJakzrnXDRHfinvgMzNuohuWxNWHQ9+Iisc3z5nAc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
