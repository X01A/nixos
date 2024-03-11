{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-03-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c3a54ec1aab480e519dbea10cd5be18c48cfe853";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-uAdXqDEMOHY/+MrJAKYln1TmcvNCoksGuKQlwAdWVu8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
