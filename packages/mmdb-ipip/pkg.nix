{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202507070312-unstable-2025-07-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "fc5a1454e779c5f02c259d03b8b7d10b0dc98e39";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-lxe1xjgtyNEQzQRWlonrBihw/aWey8CF7dOjVFUieBA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
