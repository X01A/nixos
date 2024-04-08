{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404080308-unstable-2024-04-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ec007f9864a3e69222fd5707bcbaa1baf304ae88";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-O/vS3An2ej0DqgilDrDq9LqZl3aoqEq0S4k/l0qQTLU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
