{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409300310-unstable-2024-10-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e1e08ed720430308d8c67d31fc4be46ad5267270";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-chI8eFzpUvVcBW5MlwHh6MtWH4uBINSH+JSbjasuDAg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
