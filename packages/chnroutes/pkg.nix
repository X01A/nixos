{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "48069ab741d91bf33876f30a288e8545b360da73";
    sha256 = "sha256-QKfxxC4hfQmu8Jh1TM7J/IOM/Wrnyf3DypgCgwxwJ38=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
