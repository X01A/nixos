{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505190312-unstable-2025-05-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "174a303d8c454b1dc198396352c43157a09d10e8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-fKZZGUM455Th8FBiISXS/Up3FFVhAksPpm2j4EoVFTg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
