{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411180310-unstable-2024-11-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7ff36e09e8ca0de8c90cc706665ef8a2c4b5e8dd";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-wvSeBIYSEsAcgyQ2cJ4BwuLE+o1MMEHSThv0CXu7I3g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
