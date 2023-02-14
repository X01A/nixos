{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-02-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5d486e05ffd50706514bfe6cc5bef6f431f31a64";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-b7wj6J+zgxfapHAyb14Q/4/Gl7fO6OEbvOXCJExs1sg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
