{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4b0d1c54246952d86df2b58d0992f7030b50d266";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-zQ4fCLWgR+MSsVa9sgGuG7Faeql2OihOn0+wtwXXZmQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
