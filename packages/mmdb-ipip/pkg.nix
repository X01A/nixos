{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606150332-unstable-2026-06-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1d5932dbd5f9dd82bfb4d75d6ed5bb30ff743b00";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-kMDwXoQqbBJNB3/F+3hDo2J8L/Bg5mjdJCfk8XIxTc8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
