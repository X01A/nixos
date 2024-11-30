{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ec6a1b5d08feb6d9489b4d9b86ef4228c4e410b6";
    sha256 = "sha256-xHGbEGFuY+MVzpLagAeOZBj4C0QHGkY1j3nvYKPlv8k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
