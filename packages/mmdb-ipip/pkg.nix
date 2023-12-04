{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7ddc8163980b2e69030f4f9adf975163f3fdcece";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-O+a7O9hNbtvbYc4xy77stcZoRVX2fDcFEdE3Q1MQCUQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
