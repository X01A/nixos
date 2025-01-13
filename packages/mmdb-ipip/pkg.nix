{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501130310-unstable-2025-01-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6edf39230f519b9127fb14996ed9301b8905bc2e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-8cqpxsJm17HlVeT1vlUaT2pUSZW5vmqeessEIFBWXBA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
