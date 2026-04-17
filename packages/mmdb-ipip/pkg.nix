{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604130316-unstable-2026-04-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ec4c9f1b3dc75b40c6e3a709aab9bd4b50912567";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-uh0wSuZjYlwQ7BvbQ7Hi0C+o1BKkwrwQQ9UBjzTWqws=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
