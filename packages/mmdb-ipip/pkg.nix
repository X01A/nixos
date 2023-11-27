{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bbc33ea8f84d07177b8d97ca9fffe0b9abe5e420";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-bGr0gkOgwUjOdumw49XHE7PNegKlfFZYWFpyz97Uwb8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
