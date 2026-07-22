{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202607200404-unstable-2026-07-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "99f02e164ce6e06e5bdc74246d2783d77cbb82a2";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-XorsspIDco3OGRF2nEVnxLN4RLkO3AuV4CRbqUPTIl4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
