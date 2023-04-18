{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "887a27b2a02f3abd08ff8a8f610e51f2686b7a45";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7DpckkTx12owLLloHQZmXTDmBq+1H+jHTUdtDMY4ujs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
