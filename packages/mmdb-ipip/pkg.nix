{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-02-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9d233e61ad579f5d6522780f2cd0db34e8b1edab";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-jGbGSjtH/5BZJ14rj5DwhET/UH+ihGBcQ/QqLvb1Hkc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
