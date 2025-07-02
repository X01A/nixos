{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506300312-unstable-2025-07-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ca73d558a004425ba78f04d577f6571d7e00cd94";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VcXwOKrHQuS9tENs7lvqMdcxazq10J5d5jPZeh5uxA4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
