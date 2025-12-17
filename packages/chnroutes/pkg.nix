{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3de18875a1e27caa0feb5be293798c519572e31f";
    sha256 = "sha256-fvYcR5mN7tvVA7d2voKsfB2XRTc1ikELmelreuiB3Vo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
