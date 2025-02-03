{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502030310-unstable-2025-02-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "cc3859a238b41b2c29cf6ba1872b047652109912";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-UvgFC50/fwSjgOf0oIBrO9IKnn9mJaL8dTBae4YWeqg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
