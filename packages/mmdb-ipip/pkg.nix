{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407220309-unstable-2024-07-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "353dea95ecd23b43243d4d439ef16bd892d88d55";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-NGOSB6zxPsKNclAtwZQStB2Gly6xUIrXPUhZj636zFk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
