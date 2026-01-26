{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601260303-unstable-2026-01-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "41e231a0f304cb3828b10c71b3d5615d96c974f1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-GDLbR6LhYRYWRmXSsQCd41XxKdI6Hhu9Lt5kW7g6hDQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
