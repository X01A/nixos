{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202511170302-unstable-2025-11-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0dd5440cd8bbd42f7092ef7ce7efffac1ed2c183";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-nIPLYCTfbi0x5NC/yUFOXBIdfi0KUfJH9E5gBKsFO0w=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
