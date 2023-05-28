{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1b6d8943137aa8bceee9cace641270d6145780f7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-0AmxLKxHTcwSYFkJGDsX/aEW4qRTreSRdQJCpF3DaYI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
