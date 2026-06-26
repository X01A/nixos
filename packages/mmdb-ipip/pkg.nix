{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606220332-unstable-2026-06-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "49a5c11e996e3f804463e45e54af3ceb209e9039";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-dQKDmHyfQGT+8WoO8p+tTCqRwHA60L4xwvHPAU85E+0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
