{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604130316-unstable-2026-04-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7c68d9e59ac7a4853f471f5ab363324e3128a437";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4XoGB1WW3TyjZx6iQS9PixriAkBwT+WTza9TN1On4aA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
