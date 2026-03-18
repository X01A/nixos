{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603160310-unstable-2026-03-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b823a6d11cfc793f41994d613e640e5b2a3484ac";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TJIeP67C23Xqqfdtgro1dA09B4lX79DF9mwfMJuSHeY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
