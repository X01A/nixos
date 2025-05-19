{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505190312-unstable-2025-05-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "afba5df2b917d76b48d83f260d94937ab3fe7621";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-hwSnZiFOM4zcaAm+U8CBmcl0gJHVUleb7UMNw3trJRQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
