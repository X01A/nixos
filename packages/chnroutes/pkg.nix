{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7f9b85a2d3fb0102c3c585a63235b3a086585c4e";
    sha256 = "sha256-p0b6JepWXgE2FeY1MfnmbPgp7quN/y2Z9bAiM+9DZ+k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
