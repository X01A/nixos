{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9926fa2410c664a35572596bf87253a29080c597";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-So6B14a9U6Lya5Uali7RCCRRqVJlEqIFKFiInyu3Bf4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
