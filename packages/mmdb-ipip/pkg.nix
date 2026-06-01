{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606010330-unstable-2026-05-31";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "309511fc28ae46903b970efbff6f25c7f3c7e55f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-bVapmnMrVqlLibrmCmEEFYIRt4+MdpHTPG2bRJVtwro=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
