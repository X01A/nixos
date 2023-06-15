{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "79ef470eb214c918461e9a7f5ea3acb15a2b6b99";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-SDK8s0L8e2/Pf50tw4N9efScnSu60EBGoqqNgxWKeIA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
