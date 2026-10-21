{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610190513-unstable-2026-10-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "37e41234c04734ea76b6428afb72059df5927a87";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-GfJShqPzqQq97iaOb6zZaWy96YI+tEfJQ+wGmjv7nLs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
