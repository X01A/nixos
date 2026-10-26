{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610260523-unstable-2026-10-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a6e86aca1a1266b1f9a919ca0653531c6458940c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-wJZ+KD0pZPlGKz7DqVHRODFvKyCnocs5myiGZ09EtdE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
