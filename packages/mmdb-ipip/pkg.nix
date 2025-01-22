{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501200309-unstable-2025-01-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3fc254c26750524d9bdbfd5b9bbf6164d3ba3c0a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-b3UQGVsPO4KTK7+YG5+JJElzMsElVODdoQ6uGcqIU2k=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
