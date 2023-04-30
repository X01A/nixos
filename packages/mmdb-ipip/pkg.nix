{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7e1e602ca536bedd91dff934d751b98edb8f64e4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-5M67iywEb9zdRSDroDr8+3wfz/qbrdiG79NraLpqN7E=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
