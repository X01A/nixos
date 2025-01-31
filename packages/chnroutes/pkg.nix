{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a5a320ad17fb7b2c0d100c55a78cd850a4cc5ffa";
    sha256 = "sha256-Nnau4txHzE8vlmKmM653m1OPCI6Wb+085+VNcHCvhP4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
