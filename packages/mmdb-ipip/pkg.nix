{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412300310-unstable-2025-01-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5e6a0ba6f3d090e254428536be261e608e974f7c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-yx3d8ldfe7Zv5/cVIuhXEX0YwYCyDgvYBSdqE3dfDNI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
