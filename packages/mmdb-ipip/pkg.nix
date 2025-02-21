{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502170311-unstable-2025-02-20";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b2851d31daa4de55021d0ad953c8990b146ccbe7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-SFuj9Vjx6hvZJ7EyRhLBEW2g/ZGNzuSnsZKXM+vq78w=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
