{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202505120311-unstable-2025-05-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "52cd1224adeefedec151e35c6de45d41278089fc";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-2A5fFEROKSGfCPzjatTgkPqCYhjEr8TvKeM2czv+SFY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
