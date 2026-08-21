{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608170306-unstable-2026-08-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d2adf157df25fd587ec70b09a0b703ceb07c4653";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-gDMOUNlVfSUjGR87vwzx+2U1Zq65eE1yzIGvn8Q8yuY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
