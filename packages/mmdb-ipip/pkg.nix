{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512010303-unstable-2025-12-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "884b293bb8164abdc9acedab7fc188121c8908de";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-kX/ae5W/ERdb+wcQOVC27qmByoPrUKMXbzK0LR1HFGs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
