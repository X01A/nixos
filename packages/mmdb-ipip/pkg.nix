{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607060410-unstable-2026-07-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b6c684713d8d3103e772919250eddad5258efeb8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-scTnbqtVIh6+GlJoSFko8ico3zoSAYQNdpAxezxKNXI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
