{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608100313-unstable-2026-08-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "67337ff34f4c51c6499d1ae9a711bec68e6c468e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VsXkJVKHI2V4tyWu7U7X8JofWP/Rn57JEvBFk+Zbphk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
