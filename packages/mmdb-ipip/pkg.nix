{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405130309-unstable-2024-05-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d5a478eb1b354024c65d09a057b38b8eff7cad73";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-MnUFtxxNgEKrO33+csrcBuNKETnQHdsL6o1wgoICljk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
