{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408260311-unstable-2024-08-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4753fe6e3793d055f3e01e74473e754e5e436154";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-naCe5fE2gd2j61+DYIGbx3LtrjwFoS1nfxX48eKADlc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
