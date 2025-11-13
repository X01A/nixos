{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202511100302-unstable-2025-11-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3c379c1576684a67b8e39483d43be091c59bf96d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Ls2f4RT9nU7O6FCSyPf3A1MFGslKLvd0G4UjSiZMHqg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
