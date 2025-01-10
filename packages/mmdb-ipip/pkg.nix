{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501060310-unstable-2025-01-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bd9f92072393884b187e6383fb7d43506374b032";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-I6VMeLdkfbCMgjpcpepnFQg2QRzVhRGsZlkTzgmbY2k=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
