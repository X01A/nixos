{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404010309-unstable-2024-04-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3979ac853ee3565909b75eb16f08935ed3b0b136";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Hn1fhmvLa8r0go9met1ss4R1rgSnH/UchSEX8OyncgY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
