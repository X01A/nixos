{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505120311-unstable-2025-05-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8a78ccd4f7daa0e256e4fca4741b15660bab33e7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vuvBHdvAkKcFzmnloNHV6wYFSvG1oga5+5i1DsgY33Y=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
