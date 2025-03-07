{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503030311-unstable-2025-03-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "42cc710afa84d0267750d28a5bf3d0fd6fe164bf";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-TKtJFaAJbxWZX8FF3rXayAINQQB/UC9YyWBUAIy8ni0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
