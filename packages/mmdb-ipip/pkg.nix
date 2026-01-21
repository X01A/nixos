{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601190303-unstable-2026-01-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1ba40f36a358ab966835b6dde8e5ea8a21717575";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-68CZrymNLZVowpzgNxZ/4aO2j7z8qOc1eX6WZPBmz+g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
