{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512080303-unstable-2025-12-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5c1066b2d28f17609a91f4614cfd0519f40f7b08";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9zL91lAQUG+gdbThfrtzOuOp2jhji75U3DhzKb1rRJk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
