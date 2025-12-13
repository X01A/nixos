{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ce9b24e79234dce7b5836511b4b1ff142d2b03e7";
    sha256 = "sha256-tSLFvwQ6qAfZSRh1871X5wbCUdZkJ2YGfZGtgOn94XY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
