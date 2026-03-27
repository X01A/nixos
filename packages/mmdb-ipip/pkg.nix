{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603230308-unstable-2026-03-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f278400cb98d2d4c8a4938ccfa6f4eb99157ad13";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-+wLTkL0/wnodrIsHjO4E+WmmOzLfLIl2At0Fx8xYOL0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
