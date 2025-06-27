{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506230312-unstable-2025-06-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "171cdba0661193d3dd1b05dc492e2d913aece292";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ppFJEEupwzNbX62q4mCv+HBX5fXdm6J39NVr/WV57Gs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
