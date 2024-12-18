{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412160311-unstable-2024-12-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e59bfc70cc8b5b56a160a8e1d3fc6046f40220a8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-CxuF6EK4yO+Oy7Lib5DAsQf/fhwUrVBDHbRNaRNR61A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
