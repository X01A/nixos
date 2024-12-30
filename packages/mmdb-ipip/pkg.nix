{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412300310-unstable-2024-12-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "18ea6277ed6226e7334cb425e48fb37bbffc21d0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LtxnCraudapVAB+z8ZmzeYrM+iwj9omb2//cg+VnHho=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
