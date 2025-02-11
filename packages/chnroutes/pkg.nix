{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cac6ee2ceaf254d0f83a7201ed75cd5118ad6a6a";
    sha256 = "sha256-XOD58vBbrOTha3hkkrnbQGn/p8eNRMmqFCq+Da1FsTU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
