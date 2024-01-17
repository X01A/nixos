{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fdc1beec2bad9d01a2d40ab1055f730ee11e07ab";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-nibXoFUbnFtetptXFSOnQvt92ENn3ms3gIu9vsSZw8M=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
