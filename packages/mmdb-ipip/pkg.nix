{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502030310-unstable-2025-02-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "749e7cfde8c807f607ec42f471fd6e176e953843";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LF1e040zRls57mUwn986QncBqiAtkXr5PRl+DfkdffU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
