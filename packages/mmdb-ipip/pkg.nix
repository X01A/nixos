{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412160311-unstable-2024-12-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b973db9c2bf6d0cff6840cf94062da903960880b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-79Jl9mo67wotHjuA0g/OutbtUBDQrQPlY+X31tRaVHg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
