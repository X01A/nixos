{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408050310-unstable-2024-08-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2871ac5c5e73d4b122169f2e3b104dece6b08c5f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-qXSa0aPsqhlQmSLZk03oz3i8cO5rdTMEIq4h5TULLGc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
