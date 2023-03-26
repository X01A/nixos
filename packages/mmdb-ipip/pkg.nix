{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0ac539b74403df96328f5797d53bf72ffafcd965";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-JDXqPeaKXMsMJYLFy94Kmcye5CxlgE/yWpxIxLxED/k=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
