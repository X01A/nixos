{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408120311-unstable-2024-08-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "91c6261050cafaebf3931aab9ebda9a5b2122776";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-XQIdy1K7TYa5n+R2+ieo94B3I2bU5ngL4AxWnrMWx3Y=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
