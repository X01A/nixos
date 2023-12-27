{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "93f886a3a8e4f359869a651f5c85cf5fe66488a8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-O8+KTrt0zMD+POtF3HoNsdex8sWXkb2msh9hZ6ofhsk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
