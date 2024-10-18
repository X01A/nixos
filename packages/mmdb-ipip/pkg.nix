{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410140312-unstable-2024-10-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "dac7a14009f65ec24a7c72abaa2ef9db519bad2c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-zMOD3/b5ShwCKlhZc379kuWT11LigOLlqvkCvpZ6HXo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
