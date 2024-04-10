{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404080308-unstable-2024-04-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5fa2ec22de77fa5e9498ae068e28ecfaa21ed23d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-oaUw8L9wtME7t+F3KIYtEWjw05cBcD9Rm1RsPnWp45o=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
