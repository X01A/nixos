{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4b95c570dd9ee7df9b361cbfc54c2834b4fc2d82";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-d7/olaSqqQ7C+jM+7N+GI0qjMhBcJomoZ7fuXZLCgao=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
