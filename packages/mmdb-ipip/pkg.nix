{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404290308-unstable-2024-04-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "534fe16a165abbfbc24865ff6a458b5ca42941e2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-O5guK1msp8av0em3pZL0Xr5h0i9Oo+yZxYqZ0n+J6TM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
