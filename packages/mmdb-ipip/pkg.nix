{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606010330-unstable-2026-06-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "84c14e29d93c8f1f82b34531da407e03096ddf47";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Q1xjs2AISoIYy84mfgQWE6QZc7/e/3z4NkyGgJ1V59k=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
