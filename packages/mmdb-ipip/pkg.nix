{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bb63d5e3e8d832be652d322b1d4bc9fbabe82ab6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-S5p2aBSCBlX2tGPD+q4WpBQ8JhtIdXFZ84QvTGjMS0M=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
