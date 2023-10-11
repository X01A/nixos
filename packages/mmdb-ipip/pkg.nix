{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3cb26b375e2af18b9ed1d0f9c80385378c429aa5";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-k5ro77ahH0GQB7ZuaZcptHSCaniM8+ZhNqyO25lMZso=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
