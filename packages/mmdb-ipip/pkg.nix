{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611160718-unstable-2026-11-15";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4364177bc53a2c6f50c967d685f46de2406fc2be";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-9/3hiW6tb6AtTK0WjJm/VTbaHMY/tqqqRhu6FlOas1A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
