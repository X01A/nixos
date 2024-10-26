{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "bff240a5c90a8331235c250afa8fb9022361f3bb";
    sha256 = "sha256-uWlHV8tAoL2hX51SkFCzi0q4xrQTB0yFNCk0GQsPQbE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
