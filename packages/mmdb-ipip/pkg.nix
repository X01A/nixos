{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202408190310-unstable-2024-08-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "34e40cc6f212e87b33464820bcc3202ab8225de2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-QxLSFsEQNazEKuRvK5GpaGlm9zRvQF4fDkZhlnJ1WQc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
