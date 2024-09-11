{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409090311-unstable-2024-09-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "97abebbfe3ab399245217d9439b813fc877dda36";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-MOpNdN4yjX2KoDZk0zwItTHrjwgw54Cs0HaiwZ/IjuE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
