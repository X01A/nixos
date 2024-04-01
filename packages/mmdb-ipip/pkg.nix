{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404010309-unstable-2024-03-31";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b187c86766134316db120714dcc2db10f9aec7c8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-1HeoFY9VZdWzr8+o8+vAxk9OZOXjx8EOnbElrXESMTE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
