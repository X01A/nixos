{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5c931c0d6a3b83733baf04cd227e91ba00d9c858";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9ctebsty4pknnhMXJz1z2Rjbozn+kWlYgffHd+H7+5I=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
