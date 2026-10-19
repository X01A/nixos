{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610190513-unstable-2026-10-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7bf2b0f2bca7bb1b2f8f3f59142b0d32ed076f87";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-zFEt6EeiWkryOL6Jy2VPYtZUD/0ICKGWDKnwzgJsgGI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
