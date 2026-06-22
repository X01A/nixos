{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606220332-unstable-2026-06-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4af880f6380b89651e4f18b653693ab251869f78";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-CAGtOoM0FW537qRXi/hq8H9tIMRZwWmrC4Aoi8sdj/k=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
