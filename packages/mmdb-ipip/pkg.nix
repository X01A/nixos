{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504070311-unstable-2025-04-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e96079a1640d0c58f030e4e7d95fbf3ee7ea9bca";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-qyxvACKz5ZCrodp8XGEJS5y63c1uGQ8DN3Vq0wq9lu4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
