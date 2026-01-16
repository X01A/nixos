{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601120303-unstable-2026-01-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "96a14fc08e87b9d9c913fc0710476f7403a0d90a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-JmIsU89ogXtaMK02jCzdJrNURrw/cu4hiDJ1nWnAkU0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
