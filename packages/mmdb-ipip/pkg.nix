{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411250311-unstable-2024-11-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "596a3fa8f914a9ca219add4427424b1e324635a1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-14lJebbdQN4o7mwGrEdDS4NFINbmZHRgftFjn6qciCk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
