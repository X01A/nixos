{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408050310-unstable-2024-08-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ae2464dab4a729106e1371a6879ffc382c0ddbac";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-wxjXVJsW8LIL8t06mbNymlfxRvOdbnvvWrTGPKMzFdE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
