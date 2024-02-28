{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "30faf9cd99915a0e91ccad2ea8a0f6817147fb72";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-S9lg32C+CJ5dYXi82/dPOZY84k24WVyuWsdvSceKiFQ=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
