{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "120a9062d871709fa10d7696c39c64bebeaa913f";
    sha256 = "sha256-wCGbw9coCAFYoJmqpbaXKbHZrkiymq/Nct/e+HDcFpk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
