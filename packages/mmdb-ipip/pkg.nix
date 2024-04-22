{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404220310-unstable-2024-04-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e746003cab8998c192274f2de9dd5b8fb93dfce9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-nYezIVpaVrkuKsyyzLUSCTjkCs21+ggeYMWfkTsTeAE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
