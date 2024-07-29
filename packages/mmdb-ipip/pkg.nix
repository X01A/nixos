{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407290309-unstable-2024-07-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "71935152754ce771cd39dfa9750319c6788acfbc";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TZxpFxSlDFf/Gmz06LZ2NnQEfyw6wbsGBbkz+V3lUi0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
