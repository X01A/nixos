{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406240311-unstable-2024-06-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "333fd8c6ef983cf17107add263adc1dc1f812c80";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7OnZlYgwUPUM0J/NUiA5KFTkPdScWQfZA9WIgmlR7eY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
