{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8e82d6773302b632368f17b17849ec4fb8cad5e3";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-WZ6nR0xu1/r0t87Y9yDqqWyCUrTA0iRlMCDkz/yZKwY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
