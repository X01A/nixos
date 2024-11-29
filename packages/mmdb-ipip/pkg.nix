{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411250311-unstable-2024-11-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "23d0c367192c705a01036af14695899f3afc6524";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4e/bcqLZ+9H4b8Z6JnxIWUL6/rThBZfDYsnRnnpmtsg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
