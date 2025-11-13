{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b7073adf07c64f71cbd1bd1143abc97295dfe129";
    sha256 = "sha256-FuWn7v7Ik8IVs/geQ3V+r2TyJRqtRMDBF/C6TQ0xeGc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
