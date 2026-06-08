{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606080331-unstable-2026-06-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8364003d06d9fe9763c3927d2da9082dd4586653";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-N6gyQX6Zd/shZwMF/x6ylZ8ztdzJCpO6XnT00w1PDiI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
