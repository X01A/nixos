{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608100313-unstable-2026-08-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "67144a4a6326e812fc1ef8ae76668ef35ea138a7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-6pA6VRTpPeFaFiWWgzPDDQSex8ZBeiM9Xm9aa61QPx8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
