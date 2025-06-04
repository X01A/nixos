{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202506020312-unstable-2025-06-03";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "74678762e5335f644d47f7bb40d392fc755ab8a7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-SQOazNvFf/TAoSFvQlf5u4WonePV9MS3w7Ir8tpu310=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
