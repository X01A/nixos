{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "45c53f4bd6ea4b321f076dfb9046e3b6a4357980";
    sha256 = "sha256-NUW9xkGgnNnlrnEXjNjlLN+TfFR6TS7n9noOWsBJCvA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
