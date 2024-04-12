{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404080308-unstable-2024-04-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0f910baf03c301702bd16aac6a9ed10fcc3e1d29";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TWFDh4nlApq33Vmo8RzSlAXxxEwwsEAhlIP68evl3mc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
