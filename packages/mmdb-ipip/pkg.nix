{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608100313-unstable-2026-08-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ae7228eadc2221cc8a3f246310f744b9604e36fe";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-AUqsIC4Ldhf0++NZcRKEMEYj4OGSmkjeUoFE/UkIl3o=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
