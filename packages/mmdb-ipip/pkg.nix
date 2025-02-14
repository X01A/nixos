{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502100311-unstable-2025-02-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "16a7fb96e667976ab1a1d778d15f8747b5ad5fc1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-86xRYOKy11PdNQukt148hbaqaf7TEa/hzpg8/mdakfs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
