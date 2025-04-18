{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504140311-unstable-2025-04-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b0c9ccbdf2ef9fddceeb17de18b3cdc93c0883cb";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9KrCZBWHa3VmlkaminCq2vGgd4KZ2jgOOm+2nJjZKks=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
