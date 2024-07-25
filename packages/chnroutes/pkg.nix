{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f66aa03ee5fd56699292296acdfcae755d0789b5";
    sha256 = "sha256-6xs1m+9rB+oePx/umJzgSrBuyXlB0IK4YHQulQuXXIs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
