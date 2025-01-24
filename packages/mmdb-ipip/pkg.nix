{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501200309-unstable-2025-01-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "087f076b0735e86b0af2604b675a4fbc703ad074";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-l6aLwZTDuJ5YSOFRljK7HyN3au0aRPeb+7uW6w0b9T8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
