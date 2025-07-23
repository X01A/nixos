{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202507210313-unstable-2025-07-22";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "af9aa6c2059ea66112e4aca40883630c4b267b0e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-dwq6+4JaZ/GLHI4+XkEh5F0kI0nAA9DGwgu2CAerLlI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
