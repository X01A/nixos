{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607130404-unstable-2026-07-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a6b062d1f6ec38ffed800619951779f767a19e84";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-QwDZFEUAqmyRc/5o36gDaQT60RyeYstrSCqglfvNOK8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
