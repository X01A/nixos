{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409020310-unstable-2024-09-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c433a52f8cba4756bf370f4e3e0ab687039bf975";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BaxN3xoMS2GbknFOBm50gbH88YWeiltn6QnHusha9vw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
