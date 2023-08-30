{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "77fe3755d1ab2dc68f2d364c0b8919d884e670d2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-dsMBW/aTYDLy6OXHhfakqG3pJ9xe7ygvhAVlOeETnZM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
