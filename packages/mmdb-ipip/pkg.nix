{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a80902c3586c8cab0e2bc1126c941787bf5d7882";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-KIbYWjLUS+PC1p38fJKq8sz4UUbvFLYGZbJtHDqpoz0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
