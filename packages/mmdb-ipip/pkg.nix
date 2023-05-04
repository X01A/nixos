{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "dd7f4f99cb3aa754d2bf751b9e549536848609ef";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-oqWMFf8qnimnVMJHo5WPsAdu0bmCid3lJQsl2AKYFCA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
