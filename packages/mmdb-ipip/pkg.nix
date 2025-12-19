{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512150303-unstable-2025-12-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "74025003b5f30b001b35694f6d7682a1bddc30c6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TgAVBxA2w5NvJcuEpARhy6kEfjveLqdhl8vjOWTgwDY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
