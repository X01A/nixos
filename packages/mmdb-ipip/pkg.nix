{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607200404-unstable-2026-07-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "af4fc853794f3335d87bda13885999c6de79361e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vhU0kP4cfPpdBoqyLeDht9FGzdEJL73FsJCMA8ImOwQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
