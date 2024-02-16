{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "91df4d59a71c0301ddae8272969f9e4a19e61d5b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Hb0UMFxnx72sM956FokCr2bfHgf0c/8t9hZTauPy0b8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
