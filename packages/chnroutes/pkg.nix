{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5251f5793e1201e090ff293695efbdebdcafb9c3";
    sha256 = "sha256-COMB7QMkrwAVrdv09T2ctAf0ae9hb/BiSGhqjVcgpos=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
