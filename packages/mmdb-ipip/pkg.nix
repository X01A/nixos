{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202511170302-unstable-2025-11-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a8b57eaf13200ef889ccec1ff7e854ea0a932225";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-8xpzPJdUJcqRn26Cftd3ZlaVVFuXKBJRwcg229IiO1k=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
