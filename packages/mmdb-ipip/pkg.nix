{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501270310-unstable-2025-01-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d8706f58be5b690d5c05ad0cd8fd2c7a969c0d3f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-tpa7qiiUTLbSPQohZWcLFzk0PxGp7URazmmTZ7oXfCE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
