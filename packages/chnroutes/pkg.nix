{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ae02fb89939a43ea9112dbf984ac539a7fce74d9";
    sha256 = "sha256-8LtQ23aKJCPrNk2KwShk4TMbjuG7bwM56FDYsETS0Fw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
