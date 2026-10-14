{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610120639-unstable-2026-10-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2159cd89a708fec50ee632e368381489b0be3955";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-+W1S2mqk4jokhVMZD19t9CgWjj+zV9lHEpBlAApSRhg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
