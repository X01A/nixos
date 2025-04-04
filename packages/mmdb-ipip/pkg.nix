{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503310311-unstable-2025-04-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d6f98d66628c1efedf8ff2f336b7e99a35549d85";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-IAIa+W4Unn/QLBNMPzar0vM3N30gYFEf25lAILxzDE8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
