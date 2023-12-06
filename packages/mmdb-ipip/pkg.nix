{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1abf9b20ddc784b4be8bedbcf4500af5e52b3f42";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-kPBEEmp0W9KOXua7tXrxzlonfK6MzSmAMh6/6HzsMmQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
