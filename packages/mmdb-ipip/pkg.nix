{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503100309-unstable-2025-03-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6aa5c52c9cd586003a9af3dde9f44422e800ff82";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-33S5fY0hFCa8uUGCFpfFfW+t97j/Jgo27hp7hpkSg/M=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
