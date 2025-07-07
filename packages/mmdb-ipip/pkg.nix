{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202507070312-unstable-2025-07-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b5bfaacdf5dea56ce30ed8c310f8f2a09459b0c9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-6bocgY9T3A7UrtsAsnsKeSG9ZZwJpOOSQCdtljUH8iw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
