{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fa7ef1511bc45007bfa21964fc2aa46f721268b0";
    sha256 = "sha256-URRhBnSxrAg4rMvgk/ncI0IIAEam3kJB0mqE9F6wDLY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
