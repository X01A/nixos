{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502240310-unstable-2025-02-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3365ce26b21a82060c929d477ccd9e870d5c1d67";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LXXrKqtaJKxmywgQTz7+IqmmjSIjcO1kfjyzGVzzS0Y=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
