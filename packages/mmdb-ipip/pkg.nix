{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202501270310-unstable-2025-01-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0836f71e345514172748a11c41222062fb48314a";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-sFhHCCLjJ4CryD0Kh0BWT5eG1upirvcouHcnx3zPuBE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
