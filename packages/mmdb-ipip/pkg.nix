{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0c48aeac612a6e3c3b88e826907fee2f6f94d90d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-5c8x1si0Y+GGvElCVYmXGgkQm2+00bdSrtJhCmF2NEs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
