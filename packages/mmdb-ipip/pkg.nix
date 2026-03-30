{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603300313-unstable-2026-03-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "cb1859647dc6c54e7797960727fdd9eb9faf541a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-sdan315/S6gOM+zu8tQO9rC2L19AzHKzkcR1eF68WWk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
