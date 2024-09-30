{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409300310-unstable-2024-09-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a5646b52ebdc19422de738485f4dc1e3e99731f5";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VSVkNwZLgy0YLwPJFxXTn0aPzOZesQusab9L8qPIe1g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
