{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407290309-unstable-2024-08-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b04025c2454026a503e63fbd6910e7f0b7b6f409";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-JUnnLyUNH9gRUxrceUk+9vyWCxKAOFjejv5a+6c800o=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
