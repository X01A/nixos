{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604060314-unstable-2026-04-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6de91adc167986174c27c42687371e3308a644d4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-GkFIWBR7mDoFrGhELAbnjm743t+lmI0RtK3tpQS3Pa8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
