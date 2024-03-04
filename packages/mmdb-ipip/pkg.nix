{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-03-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d71590e3fe9eff8d3fd9a6b31d6fd59be76f4dd2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-JMZmBOJkezMBbSbT4G/idqKW0VUH3Duv7rOavjmmrEk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
