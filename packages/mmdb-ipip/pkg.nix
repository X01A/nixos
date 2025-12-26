{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512220303-unstable-2025-12-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3aad203bbe0aee70256c394cbbaa57adbafd6ff9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-KtsXWLbZ4GVyDS4C/WCOwc5pmkrMEr+eJKnLVunLu/8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
