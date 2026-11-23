{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611230758-unstable-2026-11-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d3ab4ec851e577512941bb6de18605470713703b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-C2vn+X+HqPtKsqGQLMmvjXdVo+pHFN4wWfuNLiLoMrA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
