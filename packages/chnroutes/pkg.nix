{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "178ca1a4ac5f5cf80bb0ae29e77f4cf85d3ad29c";
    sha256 = "sha256-JrYCiGVDrGx5L8tl/CsFwX+X+43Pue10+EDpTvHoU4w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
