{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602020308-unstable-2026-02-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4ed0911e61548235cd70af97ca8a30a9ab208075";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-z0IKC08Db7rWjjvR1jTj2QBKNAlUAQeTpND6DO30FmA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
