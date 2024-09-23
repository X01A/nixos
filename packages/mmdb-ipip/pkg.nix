{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409230310-unstable-2024-09-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1187d05bb13a432830a30eabd9b2e51599696ed7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-S2g3lBH1L3shpxjEnB3FvIwBVZOrb19xV+Wvt5xoziQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
