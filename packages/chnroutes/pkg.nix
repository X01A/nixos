{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "96ca594019d2d3432c7fe98218dc88fc719d2a6c";
    sha256 = "sha256-mSGtErcqkwEI1u5VegeppaibpwO5C9iGrYBAtK5X3uk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
