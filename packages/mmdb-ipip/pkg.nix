{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-03-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b557b304f3dcae4e606298c4e77c9a0800fcb18c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Oy1JJ+5szqFi1OTWVAC1cLzkjYHF4vcg42TF/Wrei9g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
