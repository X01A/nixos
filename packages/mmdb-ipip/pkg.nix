{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504140311-unstable-2025-04-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1d892eea45c81ebb8ef13d87883f1b9088c0b8aa";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-As8TJQvVqvpNlK9nQ9SdJ7JerFmAdzZQV2SIqsPa3r4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
