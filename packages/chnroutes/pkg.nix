{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d24c843518a0c2c0f9bb718453459d36497110d0";
    sha256 = "sha256-pEdZi3ixq7YwmPSYhWIwacfeVHjK5+tCLNx6xVZPQLo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
