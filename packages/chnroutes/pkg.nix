{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "39e17c236ef4d490d2da004701b6bad8cad5b8cb";
    sha256 = "sha256-tLY11QG+jKZFTHePky3sjBUbD3mx+yl5A3e/mJzEaAc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
