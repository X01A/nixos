{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505260312-unstable-2025-05-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7051dbbb6e6e0d253836e8f21118864854797a86";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-0Y+6++8nzLMHFsI1WgQ5de1ILeEOfwWTMNg26jzoQS4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
