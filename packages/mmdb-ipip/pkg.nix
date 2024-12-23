{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412230310-unstable-2024-12-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d9078ffbb007bab14c888838114a12a8724746fc";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-dwE6b6moD/ZpSeNKBrcpaC4MPXCG0IpG6nDyZtuPa/8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
