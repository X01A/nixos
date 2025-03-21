{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503170310-unstable-2025-03-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "090de56e0d684063ab8951c2520564c5d177377f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-N4UJ6qAqgppX+PhrPj/p3sIH/ZjATfoXHIzp6v89zkM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
