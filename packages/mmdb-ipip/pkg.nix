{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "060b05cc1f1ca313c5c0c1d181c4a2b949fc3ba8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-/dgB3p8PdNkyyrOJIEgJVdRYi6eCKd0c6EWAmGQK6js=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
