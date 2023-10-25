{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c3718e0eb371ca4d1894dd7161663c56eccfce79";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-oJTXgOTx8pvQeJ9Wn1/FaMqy1ZyiH7kHspglNPHzPuU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
