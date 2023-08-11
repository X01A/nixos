{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bca17f7989ad7566e85c0d6b310be5ce60c64312";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-rWuHLSOS3FRWEif/LWRvGNEmzvEb6blxNebfu31z4aU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
