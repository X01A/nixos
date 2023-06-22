{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "592d55e455748c8ad4ca1fbb90ea4645d793af65";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-D8LlRprJbpN/DWP0GxL6SlTVFMSdtgPlPbeqdKmB+uk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
