{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4caa3c6b93af7bc326dae3b7b76f32e6af43d2d3";
    sha256 = "sha256-E6VJC7pPuDgksGTnti0p6DEC75jBsEnhAb8iEQi9LO0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
