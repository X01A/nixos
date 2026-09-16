{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609140306-unstable-2026-09-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f9cf5d2f2f17aeb3a486014a2b973b2f02030670";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4EWKyPiJ77Ht327FoZE8yufh4zMYarVs67/bAHpN2jY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
