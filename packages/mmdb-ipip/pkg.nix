{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202507070312-unstable-2025-07-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e655187d78ebdee8bc02701d04fe6cc9701ff975";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-8XVbJ/GUS+2P06tRMigQy4DNtbJfc8e3IZmE7S7pXw0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
