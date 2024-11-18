{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411180310-unstable-2024-11-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ef836e06ef891b8c59475f987f0d56a6cf54ae62";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9nRwqEIPDIhgYRcTmkZu4pVYsXOdNtDs4dv4ULDGMus=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
