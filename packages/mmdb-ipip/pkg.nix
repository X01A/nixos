{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602020308-unstable-2026-02-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "87a81d169d8433e32b2a2035be397f85072acc34";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-IZ4dNDH95ssOTlE6sc1vddAJMROH8uTXKxe81H8DPYY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
