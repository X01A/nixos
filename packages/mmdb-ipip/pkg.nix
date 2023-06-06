{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0a93faab932ebca6575aa453ead964c83cdf6551";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-f2Myax8COJzfb6ZrOursl7aH/MU3/MUZL84u7pFhrDw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
