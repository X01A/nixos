{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409090311-unstable-2024-09-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "999766f9a4a4241dcba4afd36b38f4d46e49ef91";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-NLloXdv/l2BQPG6FA51B3mKMs9ymabsZqr/yZ5+2hc0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
