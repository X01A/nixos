{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607130404-unstable-2026-07-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2681463a31ae2c17b3fa7862cb16dcbeb46bbdbb";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-z96o+g0CVOg+pQ1RZF1MoRUQshbADpDU3eTTjlvbr6o=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
