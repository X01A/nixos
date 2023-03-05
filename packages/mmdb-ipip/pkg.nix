{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "686a971d66ee247b48cade84e655949cf61caef4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-fnPbK2KI4ibpjeXyP2SY8d8k+14txcIQ8GiLz4DSEgo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
