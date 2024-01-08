{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2e4254e694809cb2c0d4f7f5a8aa3b2e7db3bd54";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-FxcE/kAB5ukkGn6Do524z5xw+9KqBrFIK+XkTb4ZxjI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
