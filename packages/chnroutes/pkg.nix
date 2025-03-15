{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "09b5eab027e8d36ffaec15785b6465c67fbd88da";
    sha256 = "sha256-1uKgFbyfLqAK1DyPOQZE6vBD96j7UCCVnZ+7fHoMG/s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
