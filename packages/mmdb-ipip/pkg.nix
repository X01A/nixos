{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505050312-unstable-2025-05-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "452db7f73e68233c11fbb20e6cb02a60bc3eafec";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-spVcaq1gKJ/f9qqSAT6zPvGLQPC/r68J6bP1cA9mhr8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
