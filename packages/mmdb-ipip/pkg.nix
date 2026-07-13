{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607130404-unstable-2026-07-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "de3ed81ed400bedaa4d00e546d12558370d53ffe";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-deOPk4GN70Srvb2p/Ya9Q+P5tuHZalfDduC/QW0YRYY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
