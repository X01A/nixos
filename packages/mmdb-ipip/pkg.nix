{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-09-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "399684014bca510bbea6a0926d2382b02e4b4c5d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-t8zM0fpYdRTRQJ86bNUOvuMc+yVF6jpLFS6eG47rdFE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
