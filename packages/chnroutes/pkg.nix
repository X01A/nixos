{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3225f2da547ae9da964c76efbc361ac9ee3abc9d";
    sha256 = "sha256-iUx5LEWCyii/4t4iQatXE4Ds7VCmW90fa+hdjXXYXjs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
