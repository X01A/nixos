{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404150659-unstable-2024-04-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e0d8bc5a2d2f7a98bcc8a1c32574d4a7178139c1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-/rTQiZ1otzT0Wr+9CdMarQWztSZh7Op+jMHu8m2l4bo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
