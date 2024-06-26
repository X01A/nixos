{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406240311-unstable-2024-06-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e8d779937b65f998a97a7c9c5eabe22511332299";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-xkl8WsCa7oq+GcApZB5jkJKbu6XJwXOwoFVCNCmCmU0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
