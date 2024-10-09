{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410070311-unstable-2024-10-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "59ea063b78eaf205e34caa893bde66defe4ef5e9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-O0n/beq9TMXrPWi4n2Pdqyc07FziEBmAeMxalAYYufs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
