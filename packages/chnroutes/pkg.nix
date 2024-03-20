{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "13a592daee0a833d1d7d0f7ca7c5d4fdf1fc7bf3";
    sha256 = "sha256-XFc1HVPEO5lx9C9DdH36DbACicT+Mnn+3I+bbbXQqnw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
