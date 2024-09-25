{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409230310-unstable-2024-09-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "42b237377981ab114a4da02841120423a9fa597d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-S4k+O6hZQZI4YAhJSpaCfWe3NKjuCRzOg7zpTemoOcA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
