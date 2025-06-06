{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b8f5e4da20d216056c0cf9aacb76b15d5d5dd5f5";
    sha256 = "sha256-6I4zwyOaUXHSHhUeE7wDjn6RoJABheYW9TvQU4FcuDc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
