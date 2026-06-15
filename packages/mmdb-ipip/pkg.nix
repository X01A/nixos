{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606150332-unstable-2026-06-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "7e2adbdb15ef052d8926933af46f775db6e91e67";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-udFDIMWcbQF/xzZBTGxBRh/Ws5NQTdn88k0ATSDdj64=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
