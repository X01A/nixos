{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-09-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "163c53f4aec442c5e8e4923c5a1897639378fde1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BiDvYpA+51/aS9FvadXDBSDd9cxb6+ioIcHqq6amErk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
