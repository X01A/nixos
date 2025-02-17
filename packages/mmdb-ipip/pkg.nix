{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502170311-unstable-2025-02-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d5e9cdb8e9608618001af4e11c4760a71eaa6492";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-KmevStggYLdmGTnH+C6sT6/JMfuq8Ng8JSAVu0tF0xE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
