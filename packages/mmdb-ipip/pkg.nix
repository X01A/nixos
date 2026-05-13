{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202605110325-unstable-2026-05-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "92ddedb5ba5d1023e688029ca9eaa997dc90de92";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-pB4nREfjvH7bTyg5AU/IoCtA6WFrs2rvOQ+SG7URDyY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
