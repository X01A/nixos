{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406030309-unstable-2024-06-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4ac621fbbea747bb3fd1fe84fdab6a02f83dd2e1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9n2JpUZDRnP4JTa6RQma1yxIZIIwsIgjSPsfaP592rE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
