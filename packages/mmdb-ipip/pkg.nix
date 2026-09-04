{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608310306-unstable-2026-09-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3e0710ec0a1c2b9d5e860fde70bb0f67f21910c2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-8mEsZeIuK7N0tB6680p1csas0PNtuATKDsxo1Wufcb0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
