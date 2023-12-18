{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "19267e3dcffbf9abb62a3951cfc2f6a3f89d73b5";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-WBtOahkP0B4K3HHoWG1MyJeAUntEXgjaIYUJX2bRjDQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
