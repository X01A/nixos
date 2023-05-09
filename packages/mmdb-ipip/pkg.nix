{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "66049421ca138310284cf5de5705a9b1fef34001";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-+K2ZBU26OvXC85EhOus7N5V+lZfoQWTyfsi9BBCObXE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
