{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611251054-unstable-2026-11-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "10b67c6f5901bf32f4de128ab63361f4ee3fff49";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-rHpvVmhuABR/SoGcw/TdHzyZ5k5WuTAL6foCDtZLGsk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
