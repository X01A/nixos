{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e397aed4b3485ba40fa34c2f0af073a6bb466953";
    sha256 = "sha256-ZVj0z3QbLWr+RLsfLji7rAUZeB5aRqGWSrYCAIdgcg0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
