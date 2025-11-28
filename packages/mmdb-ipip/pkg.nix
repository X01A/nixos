{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202511170302-unstable-2025-11-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "95536783b64769bf710302f562a7c3e5fe6b642f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-dzqlwVUnmgWWvf7pMSbHlIlNS22k/Up/vkdyDl2HVNU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
