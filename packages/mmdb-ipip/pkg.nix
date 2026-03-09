{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603090306-unstable-2026-03-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "877255d5ab72893a8f52d32eceb74a6d2f682dd9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-pDIF84qGu/54DNWLyPtQKFTVcqBz9ZztwfVFcncaC1w=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
