{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "dbac41637771cdc0b232e9464a2c86529282cb75";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-EnEcfVY0Z4QYMfKU0ttB0xJbGZ+gfAXosniyJ+/SsVk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
