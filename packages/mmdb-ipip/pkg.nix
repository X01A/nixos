{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202412160311-unstable-2024-12-19";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e42c16aec5c3eada6d2833a8f78b3a5f97e69ae2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-tzsE9cA32A3npSBYAe93EyTkFGIv92tG4hWwGHGD6NE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
