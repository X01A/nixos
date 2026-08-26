{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608240306-unstable-2026-08-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0bde3f8d50c387623d0b65161a11e90dd7e976f0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4ea4XqVFrgRaERmAXCKw8yn/KgB5ijSoLoni1OkWVlM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
