{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2cf09f3b59979b4e9cf530776916b4796758f0d8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-cVHWyHO2kXKrsv6f6WHQwGj8mNi6cyBu5LsUyAt7yM0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
