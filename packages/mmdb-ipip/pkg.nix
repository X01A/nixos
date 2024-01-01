{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-31";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "437c86c91f2a97e2fe2e2cb60fad2eb6808463c6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-GBrAT9x4ubMraxLL6OU8FHKjRoqaTDt85IK63plsiIM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
