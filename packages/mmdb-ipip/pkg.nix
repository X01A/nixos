{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601190303-unstable-2026-01-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9958cb9f61882af3d8f7281a10b411318235c131";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-+xNonY7SzQUznFz1VSPvKQsNTjA4v9YuuqwVY70jXw8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
