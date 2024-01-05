{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e0e8db05ce98c5f94187cb40cfd579baec2778b6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-+kupPBgHcVGFFYxg9xqnAOc3BUlFT0PXosHab8X4Qrw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
