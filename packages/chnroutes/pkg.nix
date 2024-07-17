{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b8abcfd00956055d066ad29b4857bea19c97762a";
    sha256 = "sha256-lbDljoIdbNjjzFxjwswWsv7X3vhlsERjp8VMMzBpFQU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
