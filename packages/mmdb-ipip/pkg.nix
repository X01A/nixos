{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504280312-unstable-2025-05-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ed91d9ac63238928e07d9f864aa04bc6edc6390e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-RM2PLYHCIB9gu9vTlT+cUJuPnoreS9An6HCX3jGuBxg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
