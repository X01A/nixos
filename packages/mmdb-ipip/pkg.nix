{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606080331-unstable-2026-06-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0e408d83580468a9cf8ce999ba728afcd6d1ddec";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Yg1oC6FH2kiKAey7xojTN6fxCvcgQ82ov4RpAGJbuCE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
