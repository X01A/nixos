{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411040311-unstable-2024-11-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "cf59ac84257462849851984d7f585a5196ea0d78";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-XCNNtv0ICchRcGPdcsZtMLOmLMveXBI1sU+cJPyGOpQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
