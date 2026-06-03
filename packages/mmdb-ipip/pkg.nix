{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202606010330-unstable-2026-06-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1535b18878392f3bb93c70ba90eefb5959f50bfd";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-pwtrVvuGG4mHSdLOBVBYc7QIBRGyiKAWiiljnqqcLNM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
