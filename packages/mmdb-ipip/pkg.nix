{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3a05e2cf2e09c264516433c303e4baff712aafee";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-pRf7AWiEicV/ZRXqBBSFR4OToJ+Sa4/pr85m8WsVP8A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
