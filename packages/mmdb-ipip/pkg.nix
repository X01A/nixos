{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606290331-unstable-2026-06-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6f0605565a2863065817b5551049b0a1af7cd210";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Im+FrXzZWmCWU81Q59hiOVzXvkXBeFqobHrbdcZfcHw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
