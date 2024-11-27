{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411250311-unstable-2024-11-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9838612c451de69943dab0d0734db9c616673d89";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-NMJ5IeY3qtd2eOvOjyj+HJ1gZsdZJ7OUMmGRoeuBdZM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
