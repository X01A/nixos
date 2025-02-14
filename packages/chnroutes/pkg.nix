{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "db6109cb6180b7a719ec036df661c3347b235b7b";
    sha256 = "sha256-8FUZA0tHeK3YaN/fOgg9ZUly9HaCKqOQFB+xklrZHGE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
