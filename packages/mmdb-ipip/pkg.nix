{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411040311-unstable-2024-11-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "48ad73eb944d0c7e3562366557331368f393a167";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-oWtEn2ffapK2Rvucudcnk7FdEjkFh7sjVLqVwqtg+NM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
