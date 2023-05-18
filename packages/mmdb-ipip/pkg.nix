{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2371df2560bb0470c5b978226557780255f01ceb";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-xQmpfpypjiOVZq5sHtht/QABogbw+Q4D75LjJ2+oKK0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
