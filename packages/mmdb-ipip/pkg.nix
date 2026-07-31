{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607270405-unstable-2026-07-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "383e38fd5e3cc060dcdf95bf09cb789ead6c71a4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BbBiqUf1DkwyZt2VdVif64P9L9Svqr6/CF1lQC5//bU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
