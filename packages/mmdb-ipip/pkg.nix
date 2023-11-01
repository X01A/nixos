{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-31";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8365a45f08815deea3abf3431da6e573bb0e5796";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-dpQwjbO7KhghE7/G6HFGYu/WP5jbVSIHlmNJDFHnQVY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
