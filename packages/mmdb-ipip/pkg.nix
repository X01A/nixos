{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502100311-unstable-2025-02-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "325f0181ecb9fa294a517796523fca8ac5a3347b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-12wqms19zwvYN5/hu+FkpzmxUIHzcFEDF/yPxbj8vsk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
