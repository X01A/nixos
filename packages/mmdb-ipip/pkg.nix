{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406240311-unstable-2024-06-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5f2468267fe307e363c1b3a1a58d2b157e32e46f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-eIosksjzhC6k4tBV7kZaLfJcZyXFe0lbXCmiocVEcoM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
