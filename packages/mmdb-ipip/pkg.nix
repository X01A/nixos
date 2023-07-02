{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0144a1f47358032264c6a7f3b8d2e2783f80a203";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-x7ku0Lmuh07/XxuYOW/wMqqMSBcV4Rsl6WopmKaGReQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
