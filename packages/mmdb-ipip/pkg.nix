{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409020310-unstable-2024-09-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e01a5973838fbd48a4366fa4c13d047411c82dec";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-YOzK5ivswYbYDiZ9u7u6rSBRC1nNAO7zfzhrFvv17Pw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
