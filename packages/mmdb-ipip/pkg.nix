{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ab5b836bbb42136963603fa50a4e7b6612570834";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-fTiAjckmhEAppdpyvWtSIhSuG0JxKntY7coF2uB/UWk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
