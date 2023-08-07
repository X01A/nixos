{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ce09b772135d8234f61946225042d999bdd2ea3e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-5PfmdioeXFLLDC6ZfSOX31S+2XegxTGpQ8WWL9rcSAc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
