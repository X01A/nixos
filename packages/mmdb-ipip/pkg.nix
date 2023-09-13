{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-09-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6392a80f03bdd2146eee39eecba06138420d8f8e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-K8kDA4giZph6FkBRmMxWxLZ42NgUGFuxrkn4kcgWVCc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
