{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b4f9746c6f766d204f74496c2207162434ac720d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-6p0spFFAlX7YqpNkMoyh2JQMRiNzwB6qJcnTBfweTI4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
