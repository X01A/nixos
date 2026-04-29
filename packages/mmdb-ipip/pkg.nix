{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604270319-unstable-2026-04-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4452538ab07979103d8f72b0241c424b97ae8268";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-sawYwFtWZI4o8Sk2xxsiNVSchbqeAx1o/lueuoAIJTM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
