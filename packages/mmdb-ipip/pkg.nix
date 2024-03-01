{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0d95d80cd4943f4b490c32609bda9e213922e530";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-jYWLT0ZYtrnAR0oeLKIuy/yC2Ys8sE9OSRV1/73+OqY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
