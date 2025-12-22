{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512220303-unstable-2025-12-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4e9ae71568cf88d8e8fac841dd8cf2f3ce5ed58a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VYcacFwi+4QCvOb1Oh8tAaoskrNxdjh1mQnzZl6d1pc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
