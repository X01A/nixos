{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-09-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ef3bc402ccb4b5c951746751a6088107be92e134";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ZTjsPwSjSGplpvhIBigxoulochxMj7pMKBgCyOYU+9g=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
