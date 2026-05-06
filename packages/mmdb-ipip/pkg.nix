{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605040323-unstable-2026-05-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1064721531c5b7b3462bb92e7c6ea532a4b1f5e0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-gAPKFyf0WLdnMaaUhl58SaAjzrBD/crYzFI9V5M2MRM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
