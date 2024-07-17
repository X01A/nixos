{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407150311-unstable-2024-07-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2109b6e176e66ce1b41639e53dd756800378f004";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-OjhtgSpCKMq5G5lYxx+aUi3uI2YgtgLiD6vSirtDK8Y=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
