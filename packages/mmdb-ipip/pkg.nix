{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404150659-unstable-2024-04-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "890dd1b64a9750a301f8c91e1c6afba5ae02c687";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ROY665zfEEuhUciQIw2LwyX280EjlSnJzevjDbUCj/M=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
