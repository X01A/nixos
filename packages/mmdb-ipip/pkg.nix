{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "76e1fe5cb4a1b47ea55474dbad54b740f279cfa0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-NKxQu8/X/+a1oaLg2ejZLOpMHCo6ur+z0QOHqpQBjjk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
