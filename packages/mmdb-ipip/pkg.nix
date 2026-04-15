{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604130316-unstable-2026-04-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d832883408a9a6884a41501aa97d0f5add389a6d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-FMYzT+SX89X6aQCeC+Hm1LbIRId4Zi3xqIwqVEIShNo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
