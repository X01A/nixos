{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405200309-unstable-2024-05-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "81c55d974706b26d31bc99c399510ebeab75e5c1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-RDlBC0Rhgw9B5HzXZRmgekEZ3MecZTsl+DT/0Lgr4kU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
