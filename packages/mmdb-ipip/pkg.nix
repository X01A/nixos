{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407010309-unstable-2024-07-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9b44778c23d690e1e874820b6ad92d89a7749c69";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-27fOR2ucnNNkwQBncgbcaXe+XOuDK6r7dd7E9O1OYTY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
