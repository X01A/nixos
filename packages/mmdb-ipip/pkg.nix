{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506090312-unstable-2025-06-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "981ec72131f67589bd9816df97f6d368722587d9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9cot3JfB2/y5WrDyoBqgRiaF4KU0RgwJL+smncJIfoY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
