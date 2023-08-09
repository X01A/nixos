{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "81b1a2774746a06ac1faf802e6927f93606a4b0e";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-jR0vxWQu2rnyCk4v7ByFfktGAQSppHu5VfTVeAy212Y=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
