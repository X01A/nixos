{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407220309-unstable-2024-07-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "40985e60be2a21deb74f3119722366042701f96c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-n2fWrAEU4ogq9vy7u0PghlgZaPDrtGv5J0mguMftw1g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
