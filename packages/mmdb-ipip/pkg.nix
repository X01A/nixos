{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "af2e21c7e4910e82524b7f1fd3220bede755f1cd";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-RXqk0ztrzQ9ZS52nbrjADgKA59wwn8baA1H3Y1jDJKU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
