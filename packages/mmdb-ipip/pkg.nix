{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610260523-unstable-2026-10-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "e44c32b955d0dec9d250ef93bcb53cddaf432355";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4xftUttbZbMpFpWMgKwwRANQrMENkXzl21K7qqxNOO8=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
