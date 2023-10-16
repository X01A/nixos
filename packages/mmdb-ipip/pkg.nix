{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "aab03282d4fbaea340df15210c27f5d1ce4fe635";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-gHoNY8aQrrdPXkaiaO2q+Bfzt/X9iIWJafePtRmBXsk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
