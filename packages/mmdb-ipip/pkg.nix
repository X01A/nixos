{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610120639-unstable-2026-10-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4f9ea348289e08e999ed72fbec988dcc5ecab75f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-XgYVppCdOHpw7sz/nmDAxbIHruZwqDPUOlkul0snAMo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
