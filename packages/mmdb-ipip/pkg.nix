{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602090309-unstable-2026-02-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b2d1554da9dcff61f178423f8b8ced604afb456b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-+U4WLyu3DwpQAWegnMZ/IDuHmWfCU4xYZX94OXTcMfk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
