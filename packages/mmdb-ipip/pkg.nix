{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512010303-unstable-2025-11-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "eb882ede6ce06caaef968b0a2e64163d1b920469";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-kJ4hgmvB6RKSyAcz7wA/OnZ1mecqK8K52CBsNQRRoY4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
