{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "178aa83c744d5dec9538677e9ab7b65d64ec4aad";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-KV50AOmwXmqx0X6BM8tzS2rVlf2Th6Hb7157UdQ9cuE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
