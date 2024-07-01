{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407010309-unstable-2024-06-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f181749297cf5f6779bc2ecbce834aa524d65e35";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-zzCdvrRhYdxNH/lUXl+z1k53g9fGymDhpvgrPxn7FAQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
