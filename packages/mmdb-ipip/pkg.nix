{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606290331-unstable-2026-07-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6667b6258cd9b7296b6b767abaa3994238fc9842";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-duCUMyFBxsDLrzXvPIblBhdRVZD+aQjQRanx1jTw7+A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
