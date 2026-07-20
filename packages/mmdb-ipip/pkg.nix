{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607200404-unstable-2026-07-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b4221e61e09edd9d92c08e9f174d0fd88060b873";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-a3GnKqW0BV18lx6/6bAwsfhdYzZT4d9VPfTEd/6YkHw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
