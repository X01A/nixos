{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405270309-unstable-2024-05-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ff23fc982db2e7cf5af2fe24c86edefe700b5e92";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-gObRP+A6LOHdjMsg8weqvDqBzKiKtKmaBSX/1cXY4Jk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
