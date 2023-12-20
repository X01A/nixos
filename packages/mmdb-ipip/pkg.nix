{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5cbeac80c5a409f53135da865871e2146f4700f7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-irSYIAcw7ZlFtCcirmclyxkPmay/MOWR1Vmxvuzcr14=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
