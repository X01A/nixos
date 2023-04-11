{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c08502386d97d53f2d158977f38b078407c88f42";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-wnPso8jM/7Vcv9hw6azG2QuXjUkXWERXTvsDw/VUCJg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
