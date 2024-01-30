{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ce0b3d374ef3942cfed1295e8cc4b860fae66190";
    sha256 = "sha256-yjiSUkN+fGnr+iwuIu4Nq7iOy8zuscaM+96LQiCYAgU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
