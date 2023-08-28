{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a9fc3424425b33b54e092fc0f40b7255a913ef22";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9j41phacQp/qqh5q/MkQfQIJMtr0ioMw+uoNdBIRqQQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
