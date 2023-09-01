{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-31";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "16897d2c0ea6e0084d91bfcc020b2c287fe21e02";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-tG+Eofs1lOZa6wvsyfaXIGMChlfuJLpX8z7fltPqVFg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
