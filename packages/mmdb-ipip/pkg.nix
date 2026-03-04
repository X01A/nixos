{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603020306-unstable-2026-03-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2101df3d63ce8f40ad67df714d7bf31bf5293af8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-c7AgBeYbiPBdauhQMU1ll450ohDh8vgWTM2PUvd0qwg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
