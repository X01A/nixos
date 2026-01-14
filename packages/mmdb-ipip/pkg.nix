{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202601120303-unstable-2026-01-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b87497df7a1f53c8d924a8433bb1ab7b2dfef0ef";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-NHv2houqWzz3jp3GR+fjZts+SbcMa+Z9pAGpMO065AY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
