{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412020310-unstable-2024-12-01";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "77d434c358c3e8ac1fb24384b4ca53e243c0d242";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-tlTXDX2vO+054M5hKc3PWh8KKH0l3d+8rBOedVgR0u4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
