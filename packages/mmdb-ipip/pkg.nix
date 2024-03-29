{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202403250310-unstable-2024-03-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8bce63fae775c7d127266c9a0980459ad6419681";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-pmeadl1Ul3JSer7awomH9N9qSRtb/qwM3Nxwtkf8UE4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
