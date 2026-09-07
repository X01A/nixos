{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609070306-unstable-2026-09-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "caea7c2bdba25536afa396a711b5ca30232aa07f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-46ssv2tHK4qoSPECA2aJTK004RAjQ9DqFJFnMEHC5wM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
