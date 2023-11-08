{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "27f54c2681bb2dbaddf2e9bdf5cd886b79402728";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VdBE0k7PMe2wH/TDFh5APrBBP1PFoJdUi4Y+VchHVBg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
