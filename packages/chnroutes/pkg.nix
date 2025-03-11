{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "841833b97c11c49c58e8de3e1df0b26c1e0f42ea";
    sha256 = "sha256-ZBPh+shjF+Q/M89nKCxCtyZOLmXZnSS8i8+pq7RDr4w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
