{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409160310-unstable-2024-09-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bb5f8f82df9a3d12d14df0aea74e651109154a22";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-cGg5Q4KLqR2hYgfrHzwZNCL+Qb2CR3uaCW9kFKriiB0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
