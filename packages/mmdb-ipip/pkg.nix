{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "59213e5eb240f28d27fa2d7f03632e420303881a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-fR7R6x3BR2PrqRtkhr3XDX/LO5EZMLsP5FWh8f8/Tpo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
