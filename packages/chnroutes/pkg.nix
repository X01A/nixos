{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "09b13b75143482abb3339591adbea9a4830fc2e7";
    sha256 = "sha256-X+ge3ofU6crE/huTxzkP28lslkd7FusZTtvkYx0Blp8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
