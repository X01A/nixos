{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409230310-unstable-2024-09-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4a2190e92001a1e294b145037d05bf38aae78988";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Q7v5kFHIldWERvR5Y904l5wajXwBXQY+548tliFlRsY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
