{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512080303-unstable-2025-12-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7608771b9a11d37d39f55b71d03beb0fc9ef7240";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-l+v2yGoUSnofjaRTzHGGyjkYiSEjpwnZSEpgLDrYD1Y=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
