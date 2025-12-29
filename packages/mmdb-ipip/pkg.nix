{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512290303-unstable-2025-12-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f2f1ef52e810103afa5fb597c72333e97709411d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-iIv/k+UhKDjP7xI7b66/hZH8yH8eEEGGvN4E2ap7wtM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
