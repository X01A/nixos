{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0445a5ea5e072ce9b4086d8a42b8836c9f341036";
    sha256 = "sha256-tgW4TZorl3BMd0c8pWwEL4THQi3dvvO9rgEqSd6lg9U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
