{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8f288b31d6598ea40fe9e1a581719efdd398f2af";
    sha256 = "sha256-RqD1/R338g5lIWhBCRQrWO49sXs4mkdF4JZ3OiOI34c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
