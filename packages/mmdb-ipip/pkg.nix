{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512290303-unstable-2026-01-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "433c42ec47cbc3b207df442a65ac2a7428012c04";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-u8uMM0rd42DdLTG6jb3240hwG5G5e3xNPI4GB0WFwSA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
