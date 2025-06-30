{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506300312-unstable-2025-06-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "42e337a2072e30793813cacfd2f75ef52bfd9c81";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vZWHDXzGgcTTIHKbdRisefjEtnVwx6ThWqE8NEaog9g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
