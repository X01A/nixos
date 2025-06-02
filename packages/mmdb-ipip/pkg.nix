{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506020312-unstable-2025-06-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "aba7a0a790bf72ca568c2b64043b3977e696a87f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-juiu5lVRi7du2SYnPlVmyEKPWnL/hblml/khnXW+qEo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
