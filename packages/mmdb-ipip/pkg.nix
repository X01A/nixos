{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9a55dd5e15160fb20b1ffbbf8a67ef3dcb1843e5";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-y84pcxqs7smrbIWNcfeRedM1I+hurSpTiGHtsstqyRc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
