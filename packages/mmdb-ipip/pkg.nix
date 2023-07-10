{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "86d8cc9934561c9390020e324cdd3417ba05946e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-/z3E8odyAWtzCBrNqSllS04jZjMNT1BcOcsglrIJNDA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
