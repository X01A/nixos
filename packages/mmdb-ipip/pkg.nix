{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609280549-unstable-2026-09-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "90ded00c9bc7630d66de42d1c321ad17f0ab7ee4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-yVT8ejpLYid9k9v7bm/oCOHmWHazRoDUeRHvw9yM42A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
