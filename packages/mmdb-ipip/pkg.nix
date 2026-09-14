{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609140306-unstable-2026-09-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0218142c3af9abfd77ae3eff8b29ceb986bdf6cd";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-EaQ/7pOlwFnSXzl/NlwN8xUkfw+mlFp2N69e4LPGmvA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
