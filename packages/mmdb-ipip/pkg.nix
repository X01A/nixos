{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "76fb1dd6941f2a31f25411af618d6d390a48999e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TSsjui3QJPx4RwujYIBl0IcI1Vhk3o9hjSEMqb3Fc+Y=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
