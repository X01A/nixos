{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405200309-unstable-2024-05-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d3ceb675f0b45cbbed71be756436ad5984787665";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LbsgMaswCVdgm1U8xWfALMkJzeWTaR7glxqRKj2nUXM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
