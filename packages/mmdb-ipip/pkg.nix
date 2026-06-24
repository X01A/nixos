{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606220332-unstable-2026-06-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ad82bc30bf421ce6234206c5307975e8ac64e10c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-61I4U33ZZNmXwUdJaXdccBFhghVlbCoDX1Z6RnfnkHY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
