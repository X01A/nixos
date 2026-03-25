{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603230308-unstable-2026-03-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "694eba317574d356236476449791a2154249e34a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-fh9Wtg03t7S3/Z7cCkMoCBDif9cGQpCtTvmjWyWNiVU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
