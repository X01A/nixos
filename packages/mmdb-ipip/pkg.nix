{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202608030407-unstable-2026-08-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4cb55f3199c8aaa48236107636783c205d567aad";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7SD6WIHkqrOBd019aW/66cUnKFBOSZ3D/ttin6zFMe4=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
