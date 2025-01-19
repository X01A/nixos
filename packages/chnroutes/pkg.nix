{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "28d97f25ab332cf6036d9dde2f31cd0a0cabdd85";
    sha256 = "sha256-uUVzg2z5QK/8WFH1MoxYAKnnjA5ZX9CyrLaghCFf5U0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
