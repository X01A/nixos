{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-02-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8ba20c88fe6d2cdbc0fee34d0b4970051fcfd66e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-AfqzuLT9RDfZFjS/a+PUB9MWQhKmtDuBaP61iCwdaF0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
