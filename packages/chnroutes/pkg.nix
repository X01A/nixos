{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5e6196f6c882084d6feec6597cf335f58a4faf70";
    sha256 = "sha256-Wuccv0x+GwK1cesQeL0uQSbFNOphMfUGCBPVHANMWlM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
