{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506160312-unstable-2025-06-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7291072543a89e5017484b493cb401003f0d00df";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Rw9mwz51Ct1hATDRV9UWg9KP4w0HAbmTXzHxf5i44qo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
