{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602160308-unstable-2026-02-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8a0c13b91f07c313bbef43593a463be0010aea14";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-i0i6QJe5JtMldJJzskhBFPFjGHq3dJUYq400SBv3rZA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
