{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611160718-unstable-2026-11-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "974d4152184fbe9fb058a7942c831e40f656551e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BaJqUyKstjABkGrEgBz34uqE6go9ioNHbzRlOo0G3Ps=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
