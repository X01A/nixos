{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-03-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5cb62a7f09eb691b23d94b238ad773579cd4fd2e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-wAHRV6ee26jf9Il4aa6fS71ahtZRiWmfnjVdlauu7us=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
