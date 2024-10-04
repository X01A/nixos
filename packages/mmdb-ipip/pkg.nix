{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409300310-unstable-2024-10-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "918d0d96ff7ae6594dfad166388809de0d63a0ca";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-EzRdVgg+dMGE14zeqL0/oenAq09ER/UUH7LtgyaiqQ4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
