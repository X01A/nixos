{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ee9addde5952ec8e70035b9aed622621a3b29407";
    sha256 = "sha256-t5jZyGXAF+95mtkJJr5Sp1BNzi7LiXDegUOz1q1Of08=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
