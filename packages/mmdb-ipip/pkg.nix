{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-09-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "21110b9c26b094c21f76a68e3db0b13e5cfc5088";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-C1NJ1qrwPzA5wybaySY2NY2fWw0bz7NZddKgvzadqaE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
