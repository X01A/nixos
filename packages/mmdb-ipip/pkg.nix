{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fd7f6c584d091fc96846a9163619f1f1091fd67c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-qhndwTaIwQe15+Z8FsLCsLgRv1q6WuFeoCH83K2unJM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
