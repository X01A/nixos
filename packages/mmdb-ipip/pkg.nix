{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-02-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c23d887e7673106ff3a1f9c2047685f4a1a3e078";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-qBxlx8M85Lu6K3D84priiFaqPVRMc/eSad++bxWB8vc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
