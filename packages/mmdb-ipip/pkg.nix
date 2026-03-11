{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603090306-unstable-2026-03-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b44a967aa699e1d6da00139ff4b21894515445ef";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vqqzJyv5X68IR50FLkHk6cpRDC7gJ3kq+MkVXtiZqkk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
