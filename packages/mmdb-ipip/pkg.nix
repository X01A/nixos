{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "650877eba99bf002bcdc6b3040d56d89b05457be";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-41uaBObgRlPTNPohdhHLBLe1Wd4Mpmm7Xy3dTHcoLF8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
