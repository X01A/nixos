{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404290308-unstable-2024-05-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8d45e9cc8bf73ef7e261201c98bff5f9df9299e9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-lqjkoacIFL33NWnag6EyijtJdEqetx6MNNQKin+jvzc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
