{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "caac7239c2d521d89fa275dcac0d77f874a26dd1";
    sha256 = "sha256-lWReIVeENtbU9XVeCVueh3rPpsE7ymS+J+wSL9Cja1U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
