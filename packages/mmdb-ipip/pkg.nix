{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605040323-unstable-2026-05-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7521d5aae173af7a8deb32d249c768c207e0e39a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-yFw4WlCc6vgjsG4FpJQWoxD7bfoZF9XgfrtEaEOjfGA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
