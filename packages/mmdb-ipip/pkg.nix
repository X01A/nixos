{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "a97d61e401cbb487a85fe557dbc4c087b8a58afd";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-JtmsK5BZ1nZX0zPks0QQx1Xt2mSXfMRrld32nV+xCT4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
