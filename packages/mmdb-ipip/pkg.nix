{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202507210313-unstable-2025-07-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "82e0b4e07d9f76ab4d668ef1b47f39dab36db74b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-xUou0gIrPwUDo8WSf/NNNyL0ZNyP4IZFGIjkmcNFd7M=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
