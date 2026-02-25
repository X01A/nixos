{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602230308-unstable-2026-02-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1e4aa3837bb01fdd7e79bd0d4730c8acb320367b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-gwpfpDqGH3Q+Mayq+MFzpTt6FNxBtCZa0TbPl534M7I=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
