{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609210509-unstable-2026-09-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0879cf712082002d007a21b9c772dd1fe97e40aa";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-sHxRTZHt/+fR7ttpdgALmRNINyDPrDWpuNuUHwt4pOg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
