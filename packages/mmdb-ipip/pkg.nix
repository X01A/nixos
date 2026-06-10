{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606080331-unstable-2026-06-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d83ce10b4219edfb230e70707e1506ce53eadd9c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ugqoBC2WPa0KXOo7iiOMMFpwlyb1id0a5B4u2Thk3L4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
