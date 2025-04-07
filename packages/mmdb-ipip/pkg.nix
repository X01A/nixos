{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504070311-unstable-2025-04-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "60d9793272ff308209985d929f778634290e7d90";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-wzjyayCMlRKvrUkENGoUHryLZrg1gLL05u/3dMWT2P0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
