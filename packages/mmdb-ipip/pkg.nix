{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502170311-unstable-2025-02-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7fa3bdb27974c5f54639b7c3d47fe7df649067e8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-kM95WbLSMY9dXAkXF8Nh2ZYiThO1h2pHVf6x1XZ8KMw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
