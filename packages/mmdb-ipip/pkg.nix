{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504210313-unstable-2025-04-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5d17843b06ccd419d7a06ddb5506387e622cdccf";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-iHkWKZYQC5OWdwFYWVpM0caep4YG+TsWGYOMr0Iqm+g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
