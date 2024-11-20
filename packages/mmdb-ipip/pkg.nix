{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411180310-unstable-2024-11-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5b9901ad481a60a00b84968632b62a8ef11a3b35";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-KfaYvslyKpPBYs1Iy3fRksOKzXXrcTEFJF5XjeD48cQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
