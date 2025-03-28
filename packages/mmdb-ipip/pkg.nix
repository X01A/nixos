{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503240312-unstable-2025-03-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f273601a492e5fb19c5253e9a6a424abd32f184b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-U/T/738RAXCLfS92oGJ9+ApZ3ecTnUGmoCLfKssfpW0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
