{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512150303-unstable-2025-12-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a659ef7251d1e812344885329265385f0f4edced";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-JV9Wtl6awskYt//LP0w17TPr/dXt+DUuA4/eRjzfQpk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
