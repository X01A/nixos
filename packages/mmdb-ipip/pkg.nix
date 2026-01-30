{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601260303-unstable-2026-01-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2530bff480ff96b1bbbe9bb694b1b78c22714dd8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7t3o+msxT0YOv1+0QiRKFANj5dg5sDDdZd7TdHNk3k8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
