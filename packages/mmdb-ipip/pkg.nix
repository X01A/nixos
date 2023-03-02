{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0b405a07d2b3ac6e2f2cf56636be2dcef3e29c81";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4LRsVKWV0zsDMCU6lMkJ2rb7Z1BoDJguhTCvCFzSM7Y=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
