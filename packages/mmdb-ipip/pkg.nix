{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406170311-unstable-2024-06-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2d5578f42d650385e6b6f171e59fbe36053c866d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-IKdqKdxp8dXlKUvq0UKKRJsLs/rfzijXgusRSF9uUHA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
