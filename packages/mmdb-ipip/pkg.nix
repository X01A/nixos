{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8883c5e9784d3262020bc76d3719630f22bc91c5";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-er2YnkCGwjGFud/q/zwOkItP/cbnAW7MoJfTwUPeHCM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
