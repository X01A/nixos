{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602090309-unstable-2026-02-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ed94dfd865f07b13e5ac38eff806319c37897e0e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-du9ZFNrmC8Gfqd+XYz5sqdRnLr6+4o5u7ZmlUag6kU0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
