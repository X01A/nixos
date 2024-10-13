{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "525f2d8d136b922d3f4d723bf882c76419993e66";
    sha256 = "sha256-Nx8LGGLZ+w1VCz9IhYdfm67GNB4m7OUp1okRpruTHNA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
