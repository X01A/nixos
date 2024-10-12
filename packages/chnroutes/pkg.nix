{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b71b8a0c9bc33cc956587680e04d05acc972c8e0";
    sha256 = "sha256-WH2TTXStrEYFv9ZBemrVrD6VoA4GQtnwKa71+P3VJmY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
