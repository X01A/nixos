{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505260312-unstable-2025-05-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7145b82c30fae76be1b663844527228599806e27";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-IrhvTKCLlXJWy32sy7ztYUzFX8+vZpUaj6uEDV77/94=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
