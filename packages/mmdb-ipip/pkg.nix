{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "df12ffdcc608f73e1c89bbfe32c82ec204a0a332";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LTQ1F0340QNvj5R6a/u1Fi/yEx+xp/bNUUphOtZAG3E=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
