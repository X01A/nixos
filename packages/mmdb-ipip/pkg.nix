{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-03-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b90e5aa4f1c846f9feef7422326edd5516b4a01f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-5jm5+DV8eNmKAD0wEvOOqpO8kjHWsFXpnA+ip9+DmzQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
