{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b7900439ab46538f90a58c21e3b6d6ee5d7a3f1e";
    sha256 = "sha256-nV8G4BllqAbeSXlogHFM4JGFyiSdHHMcbq/i5pRYRF4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
