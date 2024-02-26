{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c68ca7cd724bc649896513a571820eedbac14e59";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-PG2XFK5d3y+p+VRECg2OaXmLvy5KaZY/7/WLZb7saAE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
