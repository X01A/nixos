{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602160308-unstable-2026-02-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "85c8e76f1164a9a0ebf2a04f0391578a3ecd596e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-mPPSkOQHkgpMGfnLriYHQBMN8fcW3rPXRnIgQjWFK9g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
