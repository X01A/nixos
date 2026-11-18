{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611160718-unstable-2026-11-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4975811cfed41833646017d588ad078ad864a4a2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-sElNNI7lCcVNmvhjZUSV/rFlmJ8UiR2YIT7n/itkf0w=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
