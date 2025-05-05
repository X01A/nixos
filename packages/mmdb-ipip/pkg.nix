{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505050312-unstable-2025-05-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ef007736929ca8b2c4d36b9cc277149caa7cdc20";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-i5b8R61d8Lptwhh5pZuMrZhn3KgG8/nhw8gXWG3ajJk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
