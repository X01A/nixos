{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506160312-unstable-2025-06-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2df0208f1cd3ed1539a4e72d08a838487ac9d00b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-L/w8DNaHXFBDtgKQ+2NTNeNawhMYB+xiWeW37YWDZk0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
