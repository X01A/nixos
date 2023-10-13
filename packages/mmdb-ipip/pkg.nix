{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ae4a04d99eb74820571b922753b057be81904f3c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-tJRmdSwdT6HnFvAXLIRgSRJ9h0O1NhH/X3syKdGAIuQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
