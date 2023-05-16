{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "044415208520f6fdeb9aac6415e9e2f57909e1ad";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-tivFxkz0zDgXkbED7dxumDqT9nycsqqljS1cEoWNsR8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
