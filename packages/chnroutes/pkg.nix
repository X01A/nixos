{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7a5c0c67bc74d9efde1cbd44f04ca5d488489909";
    sha256 = "sha256-7Iyk0dfMq6FSsOfFC3FsgYgfOS6WTzeUmwYmXodZIjc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
