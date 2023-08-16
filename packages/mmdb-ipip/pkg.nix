{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "01c64ce801cfb4cde5263247b07a278e8bb6f68b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-askCoixt4DJn082SUD2OMHsH49Cs3isd4IFVo2NWjVA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
