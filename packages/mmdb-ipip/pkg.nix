{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611020634-unstable-2026-11-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "643205a0ca74e8310588a8fce50836b007576e24";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-lx1zGFJwZ91wZhIfOfwbbFtivu316VjUaKkPw3iFie0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
