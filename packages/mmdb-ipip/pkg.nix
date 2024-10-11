{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410070311-unstable-2024-10-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "447ef0ac700c312915d96e5695741d717291d5e4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-0LkD4tnRaKxkshql21+dTWAe6NZLW/FcpEVGaFNDFBM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
