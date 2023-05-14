{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "92847a884c3c6d590b6427c0a7efa81a12bc57ca";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-qtr0UVFey9wu92EDOyYri9T7ptusB3VHKGR2vViPvw0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
