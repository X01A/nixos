{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202409160310-unstable-2024-09-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "709f8b0e1728788ec5b8cc9ab65b6f3c0bbfa938";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-YxhZ+jI85NM4SludgCVq3UPSPq0g4A0IGMh5RUCRosQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
