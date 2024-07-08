{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407080310-unstable-2024-07-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e6aef14be83f6619fa23224909fb11c321c60a79";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-8CB1ajmZ3iy+kphNePKSnyLw959D9KTy2XX8PAaJnH0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
