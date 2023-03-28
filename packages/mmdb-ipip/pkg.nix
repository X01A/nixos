{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "81c9ca95d45f9b21b4da1a5db3cbeec5d56364d8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-tNedDESvWQBH9SkDaV6hK/93+SoCfsZEf3x/kK6349I=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
