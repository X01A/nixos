{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "874ac15a96c502bf5cfe28bb9a6f3dd28a3c3fdc";
    sha256 = "sha256-npb1lwOUtOnDSJuSj4IFhJGNZ6zxJe5zOv1Yr44szAU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
