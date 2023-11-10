{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "cdd5e425689549b2cfd6f6a2672836d4d3d95597";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Nma31BQYJAVjEeGZuaKRaYjZ74AK+nyB0VxH/Ofr5fE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
